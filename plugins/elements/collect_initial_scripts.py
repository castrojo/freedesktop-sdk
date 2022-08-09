"""
BuildStream does not save file permissions, and ownership.
include/excludes with integration commands is so complex that only
the "compose" plugin does it correctly

Because "compose" does not save file permissions and loses integration
commands (because they are executed), that means we need to save it another
file permissions another way.

This is where collect_initial_scripts works around the issue. It provides a
way to have integration scripts that we execute when we pack into an image
(filesystem, tar, ostree, etc.)
"""

import os
import re
from buildstream import Element, ElementError, Scope

class ExtractInitialScriptsElement(Element):
    def configure(self, node):
        self.node_validate(node, [
            'path',
        ])

        self.path = self.node_subst_member(node, 'path')

    def preflight(self):
        runtime_deps = list(self.dependencies(Scope.RUN, recurse=False))
        if runtime_deps:
            raise ElementError(f"{self}: Only build type dependencies supported by collect-integration elements")

        sources = list(self.sources())
        if sources:
            raise ElementError(f"{self}: collect-integration elements may not have sources")

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
        basedir = sandbox.get_directory()
        path = os.path.join(basedir, self.path.lstrip(os.sep))
        index = 0
        for dependency in self.dependencies(Scope.BUILD):
            public = dependency.get_public_data('initial-script')
            if public and 'script' in public:
                script = self.node_subst_member(public, 'script')
                index += 1
                depname = re.sub('[^A-Za-z0-9]', '_', dependency.name)
                basename = f'{index:03}-{depname}'
                filename = os.path.join(path, basename)
                os.makedirs(path, exist_ok=True)
                with open(filename, 'w', encoding="utf-8") as f:
                    f.write(script)
                os.chmod(filename, 0o755)

        return os.sep

def setup():
    return ExtractInitialScriptsElement
