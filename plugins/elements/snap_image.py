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
        self.metadata = node.get_node('metadata')

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
        basedir = sandbox.get_directory()

        reldirectory = os.path.relpath(self.directory, os.sep)
        rootdir = os.path.join(basedir, reldirectory)

        metadir = os.path.join(rootdir, 'meta')
        metadata = os.path.join(metadir, 'snap.yaml')

        with self.timed_activity("Creating snap image", silent_nested=True):
            self.stage_dependency_artifacts(sandbox,
                                            Scope.BUILD,
                                            include=self.include,
                                            exclude=self.exclude,
                                            orphans=self.include_orphans)

            os.makedirs(metadir, exist_ok=True)

            with open(metadata, 'w') as file:
                yaml.dump(self.metadata, file)


        return os.path.join(os.sep, reldirectory)

def setup():
    return SnapImageElement
