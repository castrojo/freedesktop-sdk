import os
import re
import subprocess

link_re = re.compile(r'^Link:\s*(?P<quote1>"?)(?P<link_name>.*)(?P=quote1)(?<!\s)\s+->\s+(?P<quote2>"?)(?P<target>.*)(?P=quote2)(?<!\s)\s*$')
file_re = re.compile(r'^File:\s*(?P<quote>"?)(?P<name>.*)(?P=quote)(?<!\s)\s*$')

with (
    open('WHENCE', 'r', encoding="utf-8") as whence,
    open('WHENCE.new', 'w', encoding="utf-8") as new
):
    while line := whence.readline():
        line = line.rstrip('\r\n')
        mlink = link_re.match(line)
        mfile = file_re.match(line)
        if mlink:
            link_name = mlink.group('link_name')
            target = mlink.group('target')
            new.write(f'Link: {link_name}.xz -> {target}.xz\n')
            if os.path.islink(link_name):
                os.symlink(f'{target}.xz', f'{target}.xz')
                os.unlink(link_name)
        elif mfile:
            name = mfile.group('name')
            if os.path.islink(name):
                source = os.readlink(name)
                os.symlink(f'{source}.xz', f'{name}.xz')
                os.unlink(name)
            elif not os.path.exists(f'{name}.xz'):
                subprocess.run(['xz', '-C', 'crc32', '-T0', name],
                               check=True)
            else:
                # Already compressed.
                assert not os.path.exists(name)

            new.write(f'File: {name}.xz\n')
        else:
            assert not line.startswith('Link:')
            assert not line.startswith('File:')
            new.write(line)
            new.write('\n')
    os.rename('WHENCE.new', 'WHENCE')
