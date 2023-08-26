#!/usr/bin/python3 -u
__license__ = 'MIT'
import os
import re
import sys
import typing as t

from elftools.elf.elffile import ELFFile  # pylint: disable=import-error
from elftools.elf.dynamic import DynamicSection  # pylint: disable=import-error
from elftools.common.exceptions import ELFError  # pylint: disable=import-error


SO_RE = re.compile(r'.*\.so(?:\.[\.\d]+)?$')


def _replace_prefix(path: str, old_prefix='/', new_prefix='/'):
    assert os.path.isabs(path)
    assert os.path.isabs(old_prefix)
    assert os.path.isabs(new_prefix)
    return os.path.join(new_prefix, os.path.relpath(path, old_prefix))


def resolve_path(path: str, root='/'):
    path = os.path.normpath(path)
    root = os.path.normpath(root)
    assert os.path.isabs(path)
    assert os.path.isabs(root)
    if path == '/':
        return '/'
    in_root = os.path.commonprefix([path, root]) == root
    if not in_root:
        path = _replace_prefix(path, '/', root)
    while os.path.islink(path):
        target = os.readlink(path)
        if os.path.isabs(target):
            path = _replace_prefix(target, '/', root)
        else:
            path = os.path.join(os.path.dirname(path), target)
    if not in_root:
        path = _replace_prefix(path, root, '/')
    parent = resolve_path(os.path.dirname(path), root)
    return os.path.join(parent, os.path.basename(path))


def parse_elf(elf_path: str):
    tags: t.Dict[str, t.List[str]] = {}
    try:
        with open(elf_path, 'rb') as f:
            elf = ELFFile(f)
            for section in elf.iter_sections():
                if not isinstance(section, DynamicSection):
                    continue
                for tag in section.iter_tags():
                    if tag.entry.d_tag == 'DT_NEEDED':
                        if 'needed' not in tags:
                            tags['needed'] = []
                        tags['needed'].append(tag.needed)
                    if tag.entry.d_tag == 'DT_RPATH':
                        if 'rpath' not in tags:
                            tags['rpath'] = []
                        tags['rpath'].append(tag.rpath)
                    if tag.entry.d_tag == 'DT_RUNPATH':
                        if 'runpath' not in tags:
                            tags['runpath'] = []
                        tags['runpath'].append(tag.runpath)
            return (elf_path, tags)
    except ELFError:
        return (elf_path, None)


def find_elfs(directory: str):
    for dirpath, _, filenames in os.walk(directory):
        for filename in filenames:
            fullpath = os.path.join(dirpath, filename)
            if not os.path.isfile(fullpath) or os.path.islink(fullpath):
                continue
            if not (os.access(fullpath, os.X_OK) or SO_RE.match(fullpath)):
                continue
            elf_path, elf_dyn = parse_elf(fullpath)
            if elf_dyn is not None:
                yield (elf_path, elf_dyn)


def check_elf(elf_path: str, elf_dyn: t.Dict[str, t.List[str]], root='/', libdir='/lib'):
    found_error = False
    elf_dir = _replace_prefix(os.path.dirname(elf_path), root, '/')

    paths = []
    for p in elf_dyn.get('rpath', []) + elf_dyn.get('runpath', []):
        paths += p.split(os.pathsep)

    for path in paths:
        if path.startswith('$ORIGIN'):
            _origin_path = path.replace('$ORIGIN', elf_dir)
            resolved_path = resolve_path(_origin_path, root)
        elif os.path.isabs(path):
            resolved_path = resolve_path(path, root)
        else:
            print(f'{elf_path}: has relative path: {path}')
            found_error = True
            continue
        real_path = _replace_prefix(resolved_path, '/', root)
        if not os.path.isdir(real_path):
            print(f'{elf_path}: has non-existant path: {path} (resolved to {resolved_path})')
            found_error = True
            continue
        if real_path == libdir:
            print(f'{elf_path}: has useless path (runtime): {path}')
            found_error = True
            continue
        for needed_lib in elf_dyn.get('needed', []):
            if os.path.exists(os.path.join(real_path, needed_lib)):
                break
        else:
            print(f'{elf_path}: has useless path (no needed found): {path}')
            found_error = True
            continue

    return found_error


def main():
    triplet = sys.argv[1]
    rootpath = sys.argv[2]
    libdir = f'/usr/lib/{triplet}'
    found_errors = []
    for elf_path, elf_dyn in find_elfs(rootpath):
        if 'rpath' not in elf_dyn and 'runpath' not in elf_dyn:
            continue
        found_error = check_elf(elf_path, elf_dyn, rootpath, libdir)
        found_errors.append((elf_path, found_error))
    if sum(has_error for elf, has_error in found_errors) > 0:
        sys.exit(1)
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()
