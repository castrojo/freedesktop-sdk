# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
# System tzdata needed for python std zoneinfo
- components/tzdata.bst

config:
  configure-commands:
  - |
    python3 setup.py import_cldr

sources:
- kind: git_repo
  url: github:python-babel/babel.git
  track: v*.*.*
  ref: v2.18.0-0-g56c63caf50b18b152541b5dcafd51f645d867074
# Requirement set in scripts/download_import_cldr.py
- kind: remote
  url: tar_https:unicode.org/Public/cldr/47/cldr-common-47.zip
  ref: d5ee2abac64158c04884a722f8ef4830ea22b6c74aac20185be2838db8eda788
  directory: cldr
  filename: cldr-common-47.0.zip
