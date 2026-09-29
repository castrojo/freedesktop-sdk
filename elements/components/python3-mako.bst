# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3-markupsafe.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:sqlalchemy/mako.git
  track: "rel_*"
  ref: rel_1_4_3-0-g6b833ae06fc8866b89ea7939e5d36dd71699cf05
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
