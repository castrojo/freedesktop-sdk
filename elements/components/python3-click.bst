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
# Upstream retags git tags
- kind: pypi
  name: click
  include:
  - "8.*"
  exclude:
  - "8.2.2"
  ref:
    sha256sum: 9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4
    suffix: 45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38/click-8.5.1.tar.gz
- kind: patch
  path: patches/python3-click/relax-flit-core.patch
