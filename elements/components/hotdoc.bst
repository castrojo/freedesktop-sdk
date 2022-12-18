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
    sha256sum: 35538b39225713932dae8f35708d0fae2e1c3c4b65ad4021e066577def44bd5c
    suffix: 56/ad/c3c7fb2cae9baa369317600d66f41ecbf723867f3e19e5dd56aed09b7ed0/hotdoc-0.14.0.tar.gz
