kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 71ceb10c0eefd8b8f11fe34e8a51ad07812cb1dc3de23247425fbc9ddc47b9dd
    suffix: 24/24/e50be8344fc6e9c9ae55bfcb136b33ad562776d822736da3d1ec0278b18b/tomlkit-0.11.0.tar.gz
