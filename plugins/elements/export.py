import os
import json
from buildstream import Element, Scope
from buildstream.utils import glob

class ExportElement(Element):

    BST_MIN_VERSION = "2.0"

    def configure(self, node):
        pass

    def preflight(self):
        pass

    def get_unique_key(self):
        return {'version': 6}

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        commands = []
        splits = {}

        for dep in self.dependencies(Scope.BUILD):
            result = dep.stage_artifact(sandbox, path='files')
            bstdata = dep.get_public_data('bst')
            commands = bstdata.get_str_list('integration-commands', [])
            for command in commands:

                cmd = self.node_subst_vars(command)
                commands.append(cmd)

            splits_rules = bstdata.get_node('split-rules')
            for domain, rules in splits_rules.items():
                abspaths = []
                for path in result.files_written:
                    abspaths.append(os.path.join(os.sep, path))
                for rule in rules.as_str_list():
                    for path in glob(abspaths, rule):
                        if domain not in splits:
                            splits[domain] = []
                        splits[domain].append(path)

        metadata = {
            'split-rules': splits,
            'integration-commands': commands
        }

        basedir = sandbox.get_virtual_directory()
        with basedir.open_file('metadata', mode='w') as file:
            json.dump(metadata, file)

        return os.sep

def setup():
    return ExportElement
