import os
import fnmatch

import gi
from gi.repository import OSTree, Gio, GLib
from buildstream import Source
from buildstream import utils

gi.require_version('OSTree', '1.0')
gi.require_version('Gio', '2.0')

class OSTreeMirrorSource(Source):
    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        node.validate_keys(['match', 'path', 'url', 'ref', 'gpg'] + Source.COMMON_CONFIG_KEYS)

        self.original_url = node.get_str('url', None)
        if self.original_url:
            self.url = self.translate_url(self.original_url)
        else:
            path = self.node_get_project_path(node.get_scalar('path'))
            fullpath = os.path.join(self.get_project_directory(), path)
            self.url = self.original_url = f'file://{fullpath}'
        ref = node.get_sequence('ref', None)
        if ref is not None:
            for r in ref:
                r.validate_keys(['ref', 'checksum'])
            self.ref = ref.strip_node_info()
        else:
            self.ref = {}
        self.mirror = os.path.join(self.get_mirror_directory(),
                                   utils.url_directory_name(self.original_url))

        gpg = self.node_get_project_path(node.get_scalar('gpg'))
        self.gpg = os.path.join(self.get_project_directory(), gpg)
        self.match = node.get_str('match', None)

        self.repo = OSTree.Repo.new(Gio.File.new_for_path(self.mirror))
        if os.path.isdir(self.mirror):
            self.repo.open()
        else:
            os.makedirs(self.mirror)
            self.repo.create(OSTree.RepoMode.ARCHIVE)
            self.repo.remote_add('origin', self.url, None, None)
            gpgfile = Gio.File.new_for_path(self.gpg)
            self.repo.remote_gpg_import('origin', gpgfile.read(None), None, None)

    def preflight(self):
        pass

    def get_unique_key(self):
        return [self.original_url, sorted(self.ref, key=lambda x: x['ref'])]

    def load_ref(self, node):
        self.ref = node.get_sequence('ref', None)
        if self.ref is not None:
            for r in self.ref:
                r.validate_keys(['ref', 'checksum'])

    def get_ref(self):
        return self.ref

    def set_ref(self, ref, node):
        node['ref'] = self.ref = ref

    def track(self):
        self.repo.pull('origin', None,
                       OSTree.RepoPullFlags.MIRROR,
                       None, None)

        refs = self.repo.remote_list_refs('origin')[1]
        kept_refs = []
        for ref, checksum in sorted(refs.items(), key=lambda x: x[0]):
            if not self.match or fnmatch.fnmatch(ref, self.match):
                kept_refs.append({'ref': ref, 'checksum': checksum})

        return kept_refs

    def _refs(self):
        for r in self.ref:
            ref = r['ref']
            checksum = r['checksum']
            yield ref, checksum

    def fetch(self):
        to_fetch = []
        for _, checksum in self._refs():
            found, _ = self.repo.resolve_rev(checksum, False)
            if not found:
                to_fetch.append(checksum)

        if to_fetch:
            self.repo.pull('origin', [to_fetch],
                           OSTree.RepoPullFlags.MIRROR,
                           None, None)

    def stage(self, directory):
        local_repo = OSTree.Repo.new(Gio.File.new_for_path(directory))
        local_repo.create(OSTree.RepoMode.ARCHIVE)

        refs = GLib.Variant("as", [checksum for _, checksum in self._refs()])
        options = GLib.Variant("a{sv}", {
            'refs': refs,
        })

        local_repo.pull_with_options(f'file://{self.mirror}',
                                     options, None)
        for ref, checksum in self._refs():
            local_repo.set_ref_immediate(None, ref, checksum, None)

    def is_resolved(self):
        return self.ref is not None

    def is_cached(self):
        for _, checksum in self._refs():
            found, _ = self.repo.resolve_rev(checksum, False)
            if not found:
                return False
        return True

def setup():
    return OSTreeMirrorSource
