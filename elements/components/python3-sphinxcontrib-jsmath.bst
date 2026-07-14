# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:sphinx-doc/sphinxcontrib-jsmath.git
  track: "*.*.*"
  ref: 1.0.1-0-ge4c69dd2180c7f18330d5c3fb9300ea0e8461911
- kind: patch
  path: patches/python3-sphinxcontrib-jsmath/reproducibility.patch
