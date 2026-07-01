# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:sphinx-doc/alabaster.git
  track: "*.*.*"
  ref: 1.0.0-0-gfba58a43980385019ceb593f88ab8821e17840c0
