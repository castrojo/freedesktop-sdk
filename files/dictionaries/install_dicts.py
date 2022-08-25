#!/usr/bin/python3
import sys
import xml.etree.ElementTree as ET
import os
import re
import shutil
import subprocess

def get_name(elem):
    return elem.attrib['{http://openoffice.org/2001/registry}name']

def get_type(elem):
    return elem.attrib['{http://openoffice.org/2001/registry}type']

SPELL_DEST = "hunspell"
HYPH_DEST = "hyphen"
THES_DEST = "mythes"

def parse_props(elem, origin):
    props = {}
    for prop in elem:
        prop_name = get_name(prop)
        prop_type = get_type(prop)
        res = None
        if prop_type == "xs:string":
            res = ""
            for i in list(prop)[0].itertext():
                res = res + i.replace("%origin%", origin)
        elif prop_type == "oor:string-list":
            res = []
            for i in list(prop)[0].itertext():
                res = res + i.replace("%origin%", origin).split()
        else:
            print(f"Unknown type {prop_type}")
        props[prop_name] = res
    return props

def handle_file(filename):
    tree = ET.parse(filename)
    root = tree.getroot()
    dicts = list(list(root)[0])[0]
    for element in dicts:
        name = get_name(element)
        origin = os.path.splitext(filename)[0]
        if not os.path.isdir(origin):
            origin = os.path.dirname(filename)
        props = parse_props(element, origin)
        props_format = props['Format']
        print(f"Installing {props_format}  dictionary {name}:")
        if props_format == 'DICT_SPELL':
            dest = SPELL_DEST
            prefix = ""
            suffix = ""
        elif props_format == 'DICT_HYPH':
            dest = HYPH_DEST
            prefix = "hyph_"
            suffix = ""
        elif props_format == 'DICT_THES':
            dest = THES_DEST
            prefix = "th_"
            suffix = "_v2"
        else:
            print(f"Unknown format {props_format}")
            continue

        install_root = os.environ.get('DESTDIR', '')
        symlink_dest = "/usr/share/" + dest + "/"
        os.makedirs(install_root + symlink_dest, exist_ok=True)

        for file in props['Locations']:
            if props_format == 'DICT_THES' and file.endswith(".dat") and os.path.isfile(file):
                idxname = file.replace(".dat", ".idx")
                if not os.path.isfile(idxname):
                    print(f" Generate {idxname} from {file}")
                    with (
                        open(file, "r", encoding="utf-8") as f_in,
                        open(idxname, "w", encoding="utf-8") as f_out,
                    ):
                        subprocess.run(
                            ["./th_gen_idx.pl"],
                            stdin=f_in,
                            stdout=f_out,
                        )
                    if idxname not in props['Locations']:
                        props['Locations'].append(idxname)

        for file in props['Locations']:
            if not os.path.isfile(file):
                continue
            ext = os.path.splitext(file)[1]
            basename = os.path.basename(file)
            for loc in props['Locales']:
                lang = loc.split('-')[0]
                full_dest = "/usr/share/locale/" + lang + "/" + dest + "/"
                if lang != "en":
                    os.makedirs(install_root + full_dest, exist_ok=True)
                    full_dest_file = full_dest + basename
                else:
                    full_dest_file = symlink_dest + basename
                print(f" copy {file} to {install_root + full_dest_file}")
                shutil.copyfile(file, install_root + full_dest_file)
                loc = re.sub("(?P<lang>.*)-(?P<country>[A-Z][A-Z])(?P<suffix>(?:-.*)?)", r"\g<lang>_\g<country>\g<suffix>", loc)
                symlink = symlink_dest + prefix + loc+suffix+ext
                if symlink != full_dest_file:
                    print(f" symlink {install_root + symlink} to {full_dest_file}")
                    os.symlink(os.path.relpath(full_dest_file, os.path.dirname(symlink)), install_root + symlink)

for i in sys.argv[1:]:
    handle_file(i)
