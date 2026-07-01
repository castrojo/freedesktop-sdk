# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pycparser.git
  track: release_v*
  ref: release_v3.00-0-g77de509f0268f44ee587b5a4d9f0d680e269fcae
