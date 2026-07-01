# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pyelftools.git
  track: v*
  ref: v0.33-0-g52ce435186022bd6b32012a998931fe86c985ec8
