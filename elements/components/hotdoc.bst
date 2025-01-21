kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- public-stacks/buildsystem-cmake.bst
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
    sha256sum: a9518bd2a8497ded8df6fa116632691e34ea03f9ce186655ffa228748d27775c
    suffix: 
      6d/7c/dd87a9ced954b78203508f02229f4be0c77486cca5538404ecf5b621dbc1/hotdoc-0.17.3.tar.gz
