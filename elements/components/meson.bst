kind: manual

build-depends:
- components/python3-installer.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: meson
  ref:
    sha256sum: 519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056
    suffix: 45/3b/deb72eb6aa16a7ce46ce59d780445db5fe279557ca3a13f77f3c77686c77/meson-0.63.3.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
