# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:sphinx-doc/sphinxcontrib-qthelp.git
  track: "*.*.*"
  ref: 2.0.0-0-g783caf58e9ba9cf0450746b7f65d4bc8229ccd8f
