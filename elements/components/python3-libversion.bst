# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/pkg-config.bst

depends:
- components/libversion.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:repology/py-libversion.git
  track: '*.*.*'
  ref: 1.2.4-0-g9350dfe00ea730d0fe5b5ecb6388c3a64633a431
