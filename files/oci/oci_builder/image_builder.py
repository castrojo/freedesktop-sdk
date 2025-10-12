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
import dataclasses
import enum
import functools
import gzip
import hashlib
import json
import os
import shutil
import tarfile
import tempfile
import time
from contextlib import ExitStack
from typing import Optional

from .blob import Blob
from .layer_builder import create_layer


@dataclasses.dataclass(frozen=True)
class CompressionInfo:
    mime: str
    tar_flags: str
    default_level: int | None
    wrap: callable | None


def get_gzip_opts():
    epoch = os.environ.get("SOURCE_DATE_EPOCH")
    if epoch is None:
        return {}
    return {"mtime": int(epoch)}


class LayerCompression(CompressionInfo, enum.Enum):
    gzip = (
        "application/vnd.oci.image.layer.v1.tar+gzip",
        "r:gz",
        5,
        functools.partial(gzip.GzipFile, **get_gzip_opts()),
    )
    no_compression = ("application/vnd.oci.image.layer.v1.tar", "r:", None, None)

    @classmethod
    def from_mime(cls, mime: str) -> "LayerCompression":
        for member in cls:
            if member.mime == mime:
                return member
        raise ValueError(f"Unknown layer mime type: {mime}")

    @classmethod
    def from_key(cls, key: str) -> "LayerCompression":
        try:
            return cls[key]
        except KeyError as e:
            raise ValueError(f"Unknown compression key: {key}") from e


@dataclasses.dataclass
class GlobalConfig:
    compression: LayerCompression
    compression_level: Optional[int]
    output: str


def extract_oci_image_info(path: str, index: int, global_conf: GlobalConfig):
    with open(os.path.join(path, "index.json"), "r", encoding="utf-8") as index_file:
        indexed_manifest = json.load(index_file)
    image_desc = indexed_manifest["manifests"][index]
    algo, digest = image_desc["digest"].split(":", 1)
    with open(
        os.path.join(path, "blobs", algo, digest), "r", encoding="utf-8"
    ) as manifest_file:
        image_manifest = json.load(manifest_file)
    algo, digest = image_manifest["config"]["digest"].split(":", 1)
    with open(
        os.path.join(path, "blobs", algo, digest), "r", encoding="utf-8"
    ) as config_file:
        image_config = json.load(config_file)
    diff_ids = image_config["rootfs"]["diff_ids"]
    history = image_config.get("history", [])

    layer_descs = []
    layer_files = []

    for i, layer in enumerate(image_manifest["layers"]):
        _, diff_id = diff_ids[i].split(":", 1)
        algo, digest = layer["digest"].split(":", 1)
        origfile = os.path.join(path, "blobs", algo, digest)
        output_blob = Blob(global_conf, media_type=global_conf.compression.mime)
        layer_compression = LayerCompression.from_mime(layer["mediaType"])
        with ExitStack() as stack:
            outp = stack.enter_context(output_blob.create())
            inp = stack.enter_context(open(origfile, "rb"))
            if layer_compression != global_conf.compression:
                if layer_compression.wrap is not None:
                    inp = layer_compression.wrap(filename=inp, mode="rb")
                if global_conf.compression.wrap is not None:
                    outp = global_conf.compression.wrap(
                        filename=diff_id,
                        mode="wb",
                        compresslevel=global_conf.compression_level,
                        **get_gzip_opts(),
                    )
            shutil.copyfileobj(inp, outp)

        layer_descs.append(output_blob.descriptor)
        layer_files.append(output_blob.filename)

    return layer_descs, layer_files, diff_ids, history


def build_layer(upper, lowers: list[dict[str, str]], global_conf: GlobalConfig):
    new_layer_descs = []

    with ExitStack() as stack:
        # By default tempfile will place it in /tmp, but since its an image we should
        # use /var/tmp to avoid writing all of it into ram
        os.makedirs("/var/tmp", mode=0o1777, exist_ok=True)
        tfile = stack.enter_context(tempfile.TemporaryFile(mode="w+b", dir="/var/tmp"))
        tar = stack.enter_context(tarfile.open(fileobj=tfile, mode="w:"))
        lower_tars = []
        for lower in lowers:
            layer_compression = LayerCompression.from_mime(lower["mediaType"])
            read_mode = layer_compression.tar_flags
            lower_tars.append(
                stack.enter_context(tarfile.open(name=lower, mode=read_mode))
            )
        create_layer(tar, upper, lower_tars)
        tfile.seek(0)
        tar_hash = hashlib.sha256()
        while True:
            data = tfile.read(16 * 1024)
            if len(data) == 0:
                break
            tar_hash.update(data)
        tfile.seek(0)
        blob = Blob(global_conf, media_type=global_conf.compression.mime)
        if global_conf.compression == LayerCompression.no_compression:
            with blob.create() as copiedfile:
                shutil.copyfileobj(tfile, copiedfile)
            new_layer_descs.append(blob.descriptor)
        else:
            with blob.create() as gzipfile:
                with global_conf.compression.wrap(
                    filename=tar_hash.hexdigest(), fileobj=gzipfile, mode="wb"
                ) as compressed_file:
                    shutil.copyfileobj(tfile, compressed_file)
            new_layer_descs.append(blob.descriptor)

        new_diff_ids = [f"sha256:{tar_hash.hexdigest()}"]

    return new_layer_descs, new_diff_ids


def build_image(global_conf, image):
    layer_descs = []
    layer_files = []
    diff_ids = []
    history = None

    config = {
        "created": time.strftime(
            "%Y-%m-%dT%H:%M:%SZ",
            time.gmtime(int(os.environ.get("SOURCE_DATE_EPOCH", time.time()))),
        )
    }

    if "author" in image:
        config["author"] = image["author"]
    config["architecture"] = image["architecture"]
    config["os"] = image["os"]
    if "config" in image:
        config["config"] = image["config"]

    if "parent" in image:
        parent = image["parent"]
        layer_descs, layer_files, diff_ids, history = extract_oci_image_info(
            parent["image"], parent.get("index", 0), global_conf
        )

    if "layer" in image:
        new_layer_descs, new_diff_ids = build_layer(
            image["layer"], layer_files, global_conf
        )
        layer_descs.extend(new_layer_descs)
        diff_ids.extend(new_diff_ids)

    if not history:
        history = []
    hist_entry = {}
    if "layer" not in image:
        hist_entry["empty_layer"] = True
    if "author" in image:
        hist_entry["author"] = image["author"]
    if "comment" in image:
        hist_entry["comment"] = image["comment"]
    history.append(hist_entry)

    config["rootfs"] = {"type": "layers", "diff_ids": diff_ids}
    config["history"] = history
    config_blob = Blob(
        global_conf, media_type="application/vnd.oci.image.config.v1+json", text=True
    )
    with config_blob.create() as configfile:
        json.dump(config, configfile)

    manifest = {"schemaVersion": 2}
    manifest["layers"] = layer_descs
    manifest["config"] = config_blob.descriptor
    if "annotations" in image:
        manifest["annotations"] = image["annotations"]
    manifest_blob = Blob(
        global_conf, media_type="application/vnd.oci.image.manifest.v1+json", text=True
    )
    with manifest_blob.create() as manifestfile:
        json.dump(manifest, manifestfile)
    platform = {"os": image["os"], "architecture": image["architecture"]}
    if "os.version" in image:
        platform["os.version"] = image["os.version"]
    if "os.features" in image:
        platform["os.features"] = image["os.features"]
    if "variant" in image:
        platform["variant"] = image["variant"]
    manifest_blob.descriptor["platform"] = platform

    if "index-annotations" in image:
        manifest_blob.descriptor["annotations"] = image["index-annotations"]

    return manifest_blob.descriptor


def build_images(global_conf, images, annotations):
    manifests = []

    for image in images:
        manifest = build_image(global_conf, image)
        manifests.append(manifest)

    index = {"schemaVersion": 2}
    index["manifests"] = manifests
    if annotations:
        index["annotations"] = annotations

    with open(
        os.path.join(global_conf.output, "index.json"), "w", encoding="utf-8"
    ) as index_file:
        json.dump(index, index_file)

    oci_layout = {"imageLayoutVersion": "1.0.0"}
    with open(
        os.path.join(global_conf.output, "oci-layout"), "w", encoding="utf-8"
    ) as layout_file:
        json.dump(oci_layout, layout_file)
