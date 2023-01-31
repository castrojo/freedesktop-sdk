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
    sha256sum: aee438284e82c8def684b0bcc50b1f6ed5e941af97fa940e83e2e8ef1a59da9b
    suffix: b5/16/5e24bf63cff51dcc169f43bd43b86b005c49941e09cc3482a5b370db239e/pip-23.0.tar.gz
