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
    sha256sum: ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34
    suffix: c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6/click-8.5.0.tar.gz
