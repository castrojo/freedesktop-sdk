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
    sha256sum: 408539897ee535dbfb83a153f7bc4d620f990d8bd44a52a986efc0b4d330d34a
    suffix: da/bf/1bdbe62f5fbde085351693e3a8e387a59f8220932b911b1719fe65efa2d7/pip-23.1.tar.gz
