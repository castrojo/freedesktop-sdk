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
  exclude:
  - '*rc'
  ref:
    sha256sum: 3a8e030c2334f782085f81627062cc6d4a6771edf31e055ffe374f9e6b089ab9
    suffix: b5/5b/e7b84f1107a9cd07df1436d474bb85b4d157f691ecc0c502124bb7f9275b/meson-0.64.1.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
  strip-level: 0
