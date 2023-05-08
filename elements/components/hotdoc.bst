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
- components/python3-dbus-deviation.bst
- components/python3-feedgen.bst
- components/python3-lxml.bst
- components/python3-pyyaml.bst
- components/python3-schema.bst
- components/python3-toposort.bst
- components/python3-wheezy-template.bst
- components/python3-networkx.bst
- components/python3-charset-normalizer.bst
- components/python3-pkgconfig.bst

environment:
  HOTDOC_BUILD_C_EXTENSION: enabled

public:
  bst:
    integration-commands:
    - |
      python3 << EOF
      import importlib.metadata
      importlib.metadata.requires('hotdoc')
      EOF

sources:
# Building with source from github requires npm
- kind: pypi
  name: hotdoc
  ref:
    sha256sum: b1f43f88177567e62a9da3a0f23df6ac2da2b9c76288add37dff4d7d81674327
    suffix: ce/a8/c11ea806d630d778997d6ef58ca6e86a79af98f6cffa1e50a3d29718a5b1/hotdoc-0.15.tar.gz
