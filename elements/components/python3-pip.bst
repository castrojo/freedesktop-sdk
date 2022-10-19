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
    sha256sum: 8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530
    suffix: f8/08/7f92782ff571c7c7cb6c5eeb8ebbb1f68cb02bdb24e55c5de4dd9ce98bc3/pip-22.3.tar.gz
