import os
from ruamel import yaml
from buildstream import Element, ElementError, Scope

class SnapImageElement(Element):

    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        node.validate_keys([
            'directory', 'include', 'exclude', 'metadata',
            'include-orphans'
        ])
        self.directory = self.node_subst_vars(node.get_scalar('directory'))
        self.include = node.get_str_list('include')
        self.exclude = node.get_str_list('exclude')
        self.include_orphans = node.get_bool('include-orphans')
        self.metadata = node.get_node('metadata').strip_node_info()

    def preflight(self):
        runtime_deps = list(self.dependencies(Scope.RUN, recurse=False))
        if runtime_deps:
            raise ElementError("{}: Only build type dependencies supported by flatpak_image elements"
                               .format(self))

        sources = list(self.sources())
        if sources:
            raise ElementError("{}: flatpak_image elements may not have sources".format(self))

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
        pass

    def assemble(self, sandbox):

        with self.timed_activity("Creating snap image", silent_nested=True):
            self.stage_dependency_artifacts(sandbox,
                                            Scope.BUILD,
                                            include=self.include,
                                            exclude=self.exclude,
                                            orphans=self.include_orphans)

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
