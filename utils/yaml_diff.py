#!/usr/bin/env python3

import sys
import contextlib
import tempfile
import subprocess
from ruamel import yaml

path, old_file, _, _, new_file, _, _ = \
    sys.argv[1:]

def diff(path, old, new):
    subprocess.run(["diff", '-u',
                    f'--label=a/{path}',
                    f'--label=b/{path}',
                    old, new])

with contextlib.ExitStack() as stack:
    try:
        old_data = yaml.load(stack.enter_context(open(old_file, 'r', encoding="utf-8")), Loader=yaml.Loader)
        new_data = yaml.load(stack.enter_context(open(new_file, 'r', encoding="utf-8")), Loader=yaml.Loader)
    except yaml.YAMLError:
        diff(path, old_file, new_file)
    else:
        old_formatted = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        new_formatted = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        yaml.dump(old_data, old_formatted, default_flow_style=False)
        yaml.dump(new_data, new_formatted, default_flow_style=False)
        diff(path, old_formatted.name, new_formatted.name)
