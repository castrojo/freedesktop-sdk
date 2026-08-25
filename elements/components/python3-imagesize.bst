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
  ref: 2.0.1-0-gcf87fc06d599c71b61564eca97873b7bc75ab49a
