# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-cmake.bst
- public-stacks/buildsystem-python-setuptools.bst
- components/flex.bst
- components/make.bst
- components/pkg-config.bst

depends:
- components/glib.bst
- components/json-glib.bst
- components/libxml2.bst
- components/llvm.bst
- components/python3-setuptools.bst
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-backports-entrypoints-selectable.bst
- components/python3-dbus-deviation.bst
- components/python3-faust-cchardet.bst
- components/python3-lxml.bst
- components/python3-networkx.bst
- components/python3-pkgconfig.bst
- components/python3-pyyaml.bst
- components/python3-schema.bst
- components/python3-toposort.bst
- components/python3-wheezy-template.bst

environment:
  HOTDOC_BUILD_C_EXTENSION: enabled

public:
  bst:
    integration-commands:
    - |
      hotdoc --version

sources:
# Building with source from github requires npm
- kind: pypi
  name: hotdoc
  ref:
    sha256sum: cf22977cae68ca2f1e223dc901258dcbbd0e07eca924d8156c4fc94a54cad40b
    suffix: a2/e8/799c34a47c3512899299113d55d928a5ee3d25649774c80946e97b53a7ba/hotdoc-0.18.3.tar.gz
- kind: patch
  path: patches/hotdoc/cmark-min-cmake.patch
- kind: patch
  path: patches/hotdoc/c_comment_scanner-fix-function-prototypes.patch
