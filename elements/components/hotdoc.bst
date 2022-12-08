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
- kind: pypi
  name: hotdoc
  ref:
    sha256sum: 1123a659e2c94972c32813ec301191d333db24712a83f7e3d06dd58d47cf0098
    suffix: 18/0a/4eb673ca5e267f84bbdf7ed5ebfb381860b7a23af546aca7a644f63964c2/hotdoc-0.13.7.tar.gz
- kind: patch
  path: patches/hotdoc/charset-normalizer.patch
