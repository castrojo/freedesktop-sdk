kind: manual

build-depends:
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

config:
  build-commands:
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: c95b53d309f903f33dfe5fd37e502a5c3a05ee3454d518e45df522a4f091b728
    suffix: 43/7d/1f52f99a7f2eae870483b2c2a3064511487de87911bce146df8a154fbe81/pip-23.1.1.tar.gz
