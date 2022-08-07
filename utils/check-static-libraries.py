###ToDoList:
#  i) Maybe use fnmatch or regular expressions to match files against the allow list, in such a way that we can specify partial directory paths along with filenames, in the allow_list

import argparse
import sys
import os

DESCRIBE_TEXT = """
A short program that searches a target directory for static library files (specifically, any file that ends with ".a"). The first argument should be a target directory. The second argument should be an "allow_list", listing filenames that are acceptable in the output.
Exits with exit(1) if it finds any .a files that aren't in the allow list.
"""

#read arguments with argparse
parser = argparse.ArgumentParser(description=DESCRIBE_TEXT)
parser.add_argument('target_dir')
parser.add_argument('allow_list_filename')
parser.add_argument("-v", "--verbose",
                    help="Verbose mode: Display all static libraries found, and the allow_list",
                    action="store_true"
                    )
args = parser.parse_args()

#initialise variables
all_identified_static_libraries = []
complain_list = []

#read the allow_list from file
with open(args.allow_list_filename, "r", encoding="utf-8") as allow_list_file:
    allow_list = (allow_list_file.read().split("\n"))

#filter the allow_list to remove empty lines, and hash-marked comments
allow_list = set(line for line in allow_list if line and not line.startswith("#"))

#walk the file directory
for root, dirs, files in os.walk(args.target_dir):
    for name in files:
        if name.endswith(".a"):
            if args.verbose:
                all_identified_static_libraries.append(os.path.join(root, name))
            if name not in allow_list:
                complain_list.append(os.path.join(root, name))

#Output
if args.verbose:
    print("Static Library files identified:")
    for identified_file in all_identified_static_libraries:
        print(f"  {identified_file}")
    print("Allowing static files that match the following patterns:")
    for allowed_file_pattern in allow_list:
        print(f"  {allowed_file_pattern}")
    if not complain_list:
        print("No un-allowed static libraries identified.")

if complain_list:
    print("Identified the following static library files, which are not in the allow_list:")
    for complain_filename in complain_list:
        print(f"  {complain_filename}")
    sys.exit(1)
