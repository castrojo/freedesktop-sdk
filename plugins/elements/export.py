import os
import json
from buildstream import Element, Scope
from buildstream.utils import glob

class ExportElement(Element):

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
            commands = dep.node_get_member(bstdata, list, 'integration-commands', [])
            for i in range(len(commands)):

                cmd = self.node_subst_list_element(bstdata, 'integration-commands', [i])
                commands.append(cmd)

            splits_rules = bstdata.get('split-rules')
            for domain, rules in dep.node_items(splits_rules):
                abspaths = []
                for path in result.files_written:
                    abspaths.append(os.path.join(os.sep, path))
                for rule in rules:
                    for path in glob(abspaths, rule):
                        if domain not in splits:
                            splits[domain] = []
                        splits[domain].append(path)

        metadata = {
            'split-rules': splits,
            'integration-commands': commands
        }
        with open(os.path.join(sandbox.get_directory(), 'metadata'), 'w', encoding="utf-8") as file:
            json.dump(metadata, file)

        return os.sep

def setup():
    return ExportElement
