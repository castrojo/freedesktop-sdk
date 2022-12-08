kind: pyproject

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    python3 -mflit_core.wheel

sources:
- kind: pypi
  name: packaging
  ref:
    sha256sum: 2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750ab48e2c41de2cfd3
    suffix: 6b/f7/c240d7654ddd2d2f3f328d8468d4f1f876865f6b9038b146bec0a6737c65/packaging-22.0.tar.gz
