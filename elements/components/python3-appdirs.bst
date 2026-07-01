# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:ActiveState/appdirs.git
  track: "*.*.*"
  ref: 1.4.4-0-g7af32e0b1fe57070ae8b5a717cdaebc094449518
