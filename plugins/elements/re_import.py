import os
import json
from buildstream import Element
from buildstream import Node

class ReImportElement(Element):

    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        pass

    def preflight(self):
        pass

    def get_unique_key(self):
        return {'version': 0}

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        self.stage_sources(sandbox, '/')

    def assemble(self, sandbox):
        basedir = sandbox.get_virtual_directory()
        with basedir.open_file('metadata', mode='r') as file:
            metadata = json.load(file)

        self.set_public_data('bst', Node.from_dict(metadata))
        return os.path.join(os.sep, 'files')

def setup():
    return ReImportElement
