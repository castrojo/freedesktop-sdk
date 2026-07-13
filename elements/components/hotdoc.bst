# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- public-stacks/buildsystem-cmake.bst
- components/make.bst
- components/pkg-config.bst
- components/flex.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/glib.bst
- components/libxml2.bst
- components/json-glib.bst
- components/llvm.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-backports-entrypoints-selectable.bst
- components/python3-dbus-deviation.bst
- components/python3-lxml.bst
- components/python3-pyyaml.bst
- components/python3-schema.bst
- components/python3-toposort.bst
- components/python3-wheezy-template.bst
- components/python3-networkx.bst
- components/python3-faust-cchardet.bst
- components/python3-pkgconfig.bst

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
    sha256sum: c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc
    suffix: 
      60/fd/32e24a747181e060ace04cd927698b2b5b3b90f6bf2c014e12df630c183a/hotdoc-0.17.4.tar.gz
- kind: patch
  path: patches/hotdoc/cmark-min-cmake.patch
- kind: patch
  path: patches/hotdoc/c_comment_scanner-fix-function-prototypes.patch
