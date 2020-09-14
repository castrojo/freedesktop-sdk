import os
import json
from buildstream import Element
from buildstream.utils import glob

class ExportElement(Element):

    BST_MIN_VERSION = "2.0"

    def configure(self, node):

        # These are used to internally carry state over from
        # Element.stage() to Element.assemble()
        #
        self._collect_commands = []
        self._collect_splits = {}

    def preflight(self):
        pass

    def get_unique_key(self):
        return {'version': 6}

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        commands = []
        splits = {}

        for dep in self.dependencies():
            result = dep.stage_artifact(sandbox, path='files')
            bstdata = dep.get_public_data('bst')
            commands = bstdata.get_str_list('integration-commands', [])

            self._collect_commands.extend(commands)

            splits_rules = bstdata.get_node('split-rules')
            for domain, rules in splits_rules.items():
                abspaths = []
                for path in result.files_written:
                    abspaths.append(os.path.join(os.sep, path))
                for rule in rules.as_str_list():
                    for path in glob(abspaths, rule):
                        if domain not in self._collect_splits:
                            self._collect_splits[domain] = []
                        self._collect_splits[domain].append(path)

    def assemble(self, sandbox):
        metadata = {
            'split-rules': self._collect_splits,
            'integration-commands': self._collect_commands
        }

        basedir = sandbox.get_virtual_directory()
        with basedir.open_file('metadata', mode='w') as file:
            json.dump(metadata, file)

        return os.sep

def setup():
    return ExportElement
