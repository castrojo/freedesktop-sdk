# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:package-url/packageurl-python
  track: 'v*.*.*'
  ref: v0.17.6-0-g04b755ccc388d6a53bb5277d1f95de4baa727deb
