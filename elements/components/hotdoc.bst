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
    sha256sum: ded2c2cd06f4527f891b2d469ab5bc0161fdc84aa90d07b190bd63694a059389
    suffix: 26/f3/94ed01195952d8ba87e43ed1417f03bf50cd9d7d8db9c2c4364932e150a0/hotdoc-0.18.2.tar.gz
- kind: patch
  path: patches/hotdoc/cmark-min-cmake.patch
- kind: patch
  path: patches/hotdoc/c_comment_scanner-fix-function-prototypes.patch
