import os
import re
from buildstream import Element, ElementError, Scope

class ExtractInitialScriptsElement(Element):

    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        node.validate_keys(['path'])

        self.path = self.node_subst_vars(node.get_scalar('path'))

    def preflight(self):
        runtime_deps = list(self.dependencies(Scope.RUN, recurse=False))
        if runtime_deps:
            raise ElementError("{}: Only build type dependencies supported by collect-integration elements"
                               .format(self))

        sources = list(self.sources())
        if sources:
            raise ElementError("{}: collect-integration elements may not have sources".format(self))

    def get_unique_key(self):
        key = {
            'path': self.path,
        }
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        basedir = sandbox.get_virtual_directory()
        path_components = self.path.strip(os.sep).split(os.sep)

        index = 0
        for dependency in self.dependencies(Scope.BUILD):
            public = dependency.get_public_data('initial-script')
            if public and 'script' in public:
                script = self.node_subst_vars(public.get_scalar('script'))
                index += 1
                depname = re.sub('[^A-Za-z0-9]', '_', dependency.name)
                basename = '{:03}-{}'.format(index, depname)

                pathdir = basedir.descend(*path_components, create=True)
                with pathdir.open_file(basename, mode='w') as f:
                    f.write(script)
                    os.chmod(f.fileno(), 0o755)

        return os.sep

def setup():
    return ExtractInitialScriptsElement
