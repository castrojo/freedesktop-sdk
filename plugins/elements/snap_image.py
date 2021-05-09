import os
from ruamel import yaml
from buildstream import Element

class SnapImageElement(Element):

    BST_MIN_VERSION = "2.0"
    BST_FORBID_RDEPENDS = True
    BST_FORBID_SOURCES = True

    def configure(self, node):
        node.validate_keys([
            'directory', 'include', 'exclude', 'metadata',
            'include-orphans'
        ])
        self.directory = node.get_str('directory')
        self.include = node.get_str_list('include')
        self.exclude = node.get_str_list('exclude')
        self.include_orphans = node.get_bool('include-orphans')
        self.metadata = node.get_node('metadata').strip_node_info()

    def preflight(self):
        pass

    def get_unique_key(self):
        key = {}
        key['directory'] = self.directory
        key['include'] = sorted(self.include)
        key['exclude'] = sorted(self.exclude)
        key['include-orphans'] = self.include_orphans
        key['metadata'] = self.metadata
        key['version'] = 7
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        with self.timed_activity("Staging dependencies", silent_nested=True):
            self.stage_dependency_artifacts(sandbox,
                                            include=self.include,
                                            exclude=self.exclude,
                                            orphans=self.include_orphans)

    def assemble(self, sandbox):

        with self.timed_activity("Creating snap image", silent_nested=True):
            reldirectory_path = os.path.relpath(self.directory, os.sep)
            metadir_path = os.path.join(reldirectory_path, 'meta')
            metadata_filename = 'snap.yaml'

            basedir = sandbox.get_virtual_directory()
            metadir = basedir.descend(*metadir_path.split(os.sep), create=True)

            with metadir.open_file(metadata_filename, mode='w') as file:
                yaml.dump(self.metadata, file)

        return os.path.join(os.sep, reldirectory_path)

def setup():
    return SnapImageElement
