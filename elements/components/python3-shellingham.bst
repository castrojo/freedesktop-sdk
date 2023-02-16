kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  ref:
    sha256sum: 823bc5fb5c34d60f285b624e7264f4dda254bc803a3774a147bf99c0e3004a28
    suffix: 1f/13/fab0a3f512478bc387b66c51557ee715ede8e9811c77ce952f9b9a4d8ac1/shellingham-1.5.0.post1.tar.gz
