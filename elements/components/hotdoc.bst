kind: pip

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3-pip.bst
- components/python3-wheel.bst
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
- components/python3-faust-cchardet.bst
- components/python3-lxml.bst
- components/python3-pyyaml.bst
- components/python3-schema.bst
- components/python3-toposort.bst
- components/python3-wheezy-template.bst
- components/python3-networkx.bst
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
    sha256sum: af1856d54f9dd23e0538a7dc4423b69d29dd7f54a4fe6e34844606ab51a3eab3
    suffix: 
      ff/15/76b275a377784484e3a9e7a8e35f3d76b69b1a74f65868158ad43d96d304/hotdoc-0.16.tar.gz
