# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:shibukawa/imagesize_py.git
  track: "*.*.*"
  ref: 2.0.0-0-g5ab28d47b96d6a0738ec036034919a739b4d64da
