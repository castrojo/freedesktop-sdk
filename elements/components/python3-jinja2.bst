# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3-markupsafe.bst
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pallets/jinja.git
  track: "*.*.*"
  exclude:
  - "*.*.x"
  ref: 3.1.6-0-g15206881c006c79667fe5154fe80c01c65410679
