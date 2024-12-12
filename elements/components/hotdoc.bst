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
    sha256sum: 2e90156337d1f9214bbef9758cfa89b7815ae5efbb09bcdf15ae476e5fd258df
    suffix: 
      7a/52/6eb10a38b207bac9a02a25e96b0b23712095d614112006e958c53cbb5ae9/hotdoc-0.17.2.tar.gz
