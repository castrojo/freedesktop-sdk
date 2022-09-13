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
    sha256sum: 16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf
    suffix: a7/f0/565f731cd138a516c2dba8439e47c5622493c82f41c4845d287617ef6ec9/meson-0.63.2.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
