# Copyright (c) 2019, 2020 Codethink Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import tempfile
import tarfile
import hashlib
import shutil
import json
import os
import gzip
from contextlib import ExitStack

from .layer_builder import create_layer
from .blob import Blob


def get_gzip_opts():
    epoch = os.environ.get('SOURCE_DATE_EPOCH')
    if epoch is None:
        return {}
    return {'mtime': int(epoch)}


def extract_docker_image_info(path, index, global_conf, os_value, legacy_parent):
    with open(os.path.join(path, 'manifest.json'), 'r', encoding='utf-8') as manifest_file:
        manifest_indexed = json.load(manifest_file)
    manifest = manifest_indexed[index]
    layers = manifest['Layers']
    with open(os.path.join(path, manifest['Config']), 'r', encoding='utf-8') as config_file:
        image_config = json.load(config_file)
    diff_ids = image_config['rootfs']['diff_ids']
    if 'history' in image_config:
        history = image_config['history']

    layer_descs = []
    layer_files = []

    for i, layer in enumerate(layers):
        _, diff_id = diff_ids[i].split(':', 1)
        with open(os.path.join(path, layer), 'rb') as origblob:
            if global_conf.gzip:
                targz_blob = Blob(global_conf,
                                  media_type='application/vnd.oci.image.layer.v1.tar+gzip')
                with targz_blob.create() as gzipfile:
                    with gzip.GzipFile(filename=diff_id, fileobj=gzipfile,
                                       mode='wb', **get_gzip_opts()) as gzstream:
                        shutil.copyfileobj(origblob, gzstream)
                layer_descs.append(targz_blob.descriptor)
                layer_files.append(targz_blob.filename)
                legacy_parent = tar_blob.legacy_id
            else:
                legacy_config = {
                    'os': os_value
                }
                if legacy_parent:
                    legacy_config['parent'] = legacy_parent
                tar_blob = Blob(global_conf, media_type='application/vnd.oci.image.layer.v1.tar')
                with tar_blob.create() as newfile:
                    shutil.copyfileobj(origblob, newfile)
                layer_descs.append(tar_blob.descriptor)
                layer_files.append(tar_blob.filename)
                legacy_parent = tar_blob.legacy_id
    return layer_descs, layer_files, diff_ids, history, legacy_parent


def extract_oci_image_info(path, index, global_conf, os_value, new_layer, legacy_parent, config):
    with open(os.path.join(path, 'index.json'), 'r', encoding='utf-8') as index_file:
        indexed_manifest = json.load(index_file)
    image_desc = \
        indexed_manifest['manifests'][index]
    algo, digest = image_desc['digest'].split(':', 1)
    with open(os.path.join(path, 'blobs', algo, digest), 'r', encoding='utf-8') as manifest_file:
        image_manifest = json.load(manifest_file)
    algo, digest = image_manifest['config']['digest'].split(':', 1)
    with open(os.path.join(path, 'blobs', algo, digest), 'r', encoding='utf-8') as config_file:
        image_config = json.load(config_file)
    diff_ids = image_config['rootfs']['diff_ids']
    if 'history' in image_config:
        history = image_config['history']

    layer_descs = []
    layer_files = []

    for i, layer in enumerate(image_manifest['layers']):
        _, diff_id = diff_ids[i].split(':', 1)
        algo, digest = layer['digest'].split(':', 1)
        origfile = os.path.join(path, 'blobs', algo, digest)
        if not new_layer and i+1 == len(image_manifest['layers']):
            # The case were we do not add a layer,
            # the last imported layer has to be fully reconfigured
            legacy_config = {}
            legacy_config.update(config)
            if legacy_parent:
                legacy_config['parent'] = legacy_parent
        else:
            legacy_config = {
                'os': os_value
            }
            if legacy_parent:
                legacy_config['parent'] = legacy_parent
            if global_conf.gzip:
                output_blob = Blob(global_conf,
                                   media_type='application/vnd.oci.image.layer.v1.tar+gzip')
            else:
                output_blob = Blob(global_conf,
                                   media_type='application/vnd.oci.image.layer.v1.tar',
                                   legacy_config=legacy_config)
            with ExitStack() as stack:
                outp = stack.enter_context(output_blob.create())
                inp = stack.enter_context(open(origfile, 'rb'))
                if layer['mediaType'].endswith('+gzip'):
                    if global_conf.gzip:
                        shutil.copyfileobj(inp, outp)
                    else:
                        gzfile = stack.enter_context(gzip.open(filename=inp, mode='rb'))
                        shutil.copyfileobj(gzfile, outp)
                else:
                    if global_conf.gzip:
                        gzfile = stack.enter_context(gzip.GzipFile(filename=diff_id, fileobj=outp,
                                                                   mode='wb', **get_gzip_opts()))
                        shutil.copyfileobj(inp, gzfile)
                    else:
                        shutil.copyfileobj(inp, outp)

            layer_descs.append(output_blob.descriptor)
            layer_files.append(output_blob.filename)
            legacy_parent = output_blob.legacy_id

    return layer_descs, layer_files, diff_ids, history, legacy_parent


def extract_image_info(path, index, global_conf, os_value, new_layer, legacy_parent, config):
    if not os.path.exists(os.path.join(path, 'index.json')):
        return extract_docker_image_info(path, index, global_conf, os_value, legacy_parent)
    return extract_oci_image_info(path, index, global_conf,
                                  os_value, new_layer, legacy_parent, config)


def build_layer(upper, lowers, legacy_config, global_conf):
    new_layer_descs = []
    new_legacy_parent = None

    with ExitStack() as stack:
        tfile = stack.enter_context(tempfile.TemporaryFile(mode='w+b'))
        tar = stack.enter_context(tarfile.open(fileobj=tfile, mode='w:'))
        lower_tars = []
        read_mode = 'r:gz' if global_conf.gzip else 'r:'
        for lower in lowers:
            lower_tars.append(stack.enter_context(tarfile.open(name=lower, mode=read_mode)))
        create_layer(tar, upper, lower_tars)
        tfile.seek(0)
        tar_hash = hashlib.sha256()
        while True:
            data = tfile.read(16*1024)
            if len(data) == 0:
                break
            tar_hash.update(data)
        tfile.seek(0)
        if global_conf.gzip:
            targz_blob = Blob(global_conf,
                              media_type='application/vnd.oci.image.layer.v1.tar+gzip')
            with targz_blob.create() as gzipfile:
                with gzip.GzipFile(filename=tar_hash.hexdigest(), fileobj=gzipfile,
                                   mode='wb', **get_gzip_opts()) as gzip_file:
                    shutil.copyfileobj(tfile, gzip_file)
            new_layer_descs.append(targz_blob.descriptor)
        else:
            copied_blob = Blob(global_conf,
                               media_type='application/vnd.oci.image.layer.v1.tar',
                               legacy_config=legacy_config)
            with copied_blob.create() as copiedfile:
                shutil.copyfileobj(tfile, copiedfile)
            new_layer_descs.append(copied_blob.descriptor)
            new_legacy_parent = copied_blob.legacy_id

        new_diff_ids = [f'sha256:{tar_hash.hexdigest()}']

    return new_layer_descs, new_legacy_parent, new_diff_ids


def build_image(global_conf, image):
    layer_descs = []
    layer_files = []
    diff_ids = []
    history = None
    legacy_parent = None

    config = {
        "created": global_conf.created
    }

    if 'author' in image:
        config['author'] = image['author']
    config['architecture'] = image['architecture']
    config['os'] = image['os']
    if 'config' in image:
        config['config'] = image['config']

    if 'parent' in image:
        parent = image['parent']
        layer_descs, layer_files, diff_ids, history, legacy_parent = \
            extract_image_info(parent['image'],
                               parent.get('index', 0),
                               global_conf,
                               image['os'],
                               'layer' in image,
                               legacy_parent,
                               config)

    legacy_config = {}
    legacy_config.update(config)
    if legacy_parent:
        legacy_config['parent'] = legacy_parent

    if 'layer' in image:
        new_layer_descs, new_legacy_parent, new_diff_ids = \
            build_layer(image['layer'], layer_files, legacy_config, global_conf)
        layer_descs.extend(new_layer_descs)
        diff_ids.extend(new_diff_ids)
        if new_legacy_parent is not None:
            legacy_parent = new_legacy_parent

    if not history:
        history = []
    hist_entry = {}
    if 'layer' not in image:
        hist_entry['empty_layer'] = True
    if 'author' in image:
        hist_entry['author'] = image['author']
    if 'comment' in image:
        hist_entry['comment'] = image['comment']
    history.append(hist_entry)

    config['rootfs'] = {'type': 'layers',
                        'diff_ids': diff_ids}
    config['history'] = history
    config_blob = Blob(global_conf,
                       media_type='application/vnd.oci.image.config.v1+json',
                       text=True)
    with config_blob.create() as configfile:
        json.dump(config, configfile)

    if global_conf.mode == 'docker':
        manifest = {
            'Config': config_blob.descriptor,
            'Layers': layer_descs
        }
        legacy_repositories = {}
        if 'tags' in image:
            manifest['RepoTags'] = image['tags']
            for tag in image['tags']:
                name, version = tag.split(':', 1)
                if name not in legacy_repositories:
                    legacy_repositories[name] = {}
                legacy_repositories[name][version] = legacy_parent

        return manifest, legacy_repositories

    manifest = {
        'schemaVersion': 2
    }
    manifest['layers'] = layer_descs
    manifest['config'] = config_blob.descriptor
    if 'annotations' in image:
        manifest['annotations'] = image['annotations']
    manifest_blob = Blob(global_conf,
                         media_type='application/vnd.oci.image.manifest.v1+json',
                         text=True)
    with manifest_blob.create() as manifestfile:
        json.dump(manifest, manifestfile)
    platform = {
        'os': image['os'],
        'architecture': image['architecture']
    }
    if 'os.version' in image:
        platform['os.version'] = image['os.version']
    if 'os.features' in image:
        platform['os.features'] = image['os.features']
    if 'variant' in image:
        platform['variant'] = image['variant']
    manifest_blob.descriptor['platform'] = platform

    if 'index-annotations' in image:
        manifest_blob.descriptor['annotations'] = image['index-annotations']

    return manifest_blob.descriptor, {}


def build_images(global_conf, images, annotations):
    manifests = []
    legacy_repositories = {}

    for image in images:
        manifest, legacy_repositories_part = build_image(global_conf, image)
        manifests.append(manifest)
        legacy_repositories.update(legacy_repositories_part)

    if global_conf.mode == 'docker':
        with open(os.path.join(global_conf.output, 'manifest.json'),
                  'w', encoding='utf-8') as manifest_file:
            json.dump(manifests, manifest_file)
        with open(os.path.join(global_conf.output, 'repositories'),
                  'w', encoding='utf-8') as legacy_file:
            json.dump(legacy_repositories, legacy_file)
    else:
        index = {
            'schemaVersion': 2
        }
        index['manifests'] = manifests
        if annotations:
            index['annotations'] = annotations

        with open(os.path.join(global_conf.output, 'index.json'),
                  'w', encoding='utf-8') as index_file:
            json.dump(index, index_file)

        oci_layout = {
            'imageLayoutVersion': '1.0.0'
        }
        with open(os.path.join(global_conf.output, 'oci-layout'),
                  'w', encoding='utf-8') as layout_file:
            json.dump(oci_layout, layout_file)
