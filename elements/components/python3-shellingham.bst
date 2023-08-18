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
    sha256sum: cb4a6fec583535bc6da17b647dd2330cf7ef30239e05d547d99ae3705fd0f7f8
    suffix: 74/31/6d2297b76389dd1b542962063675eb19bb9225421f278d9241da0c672739/shellingham-1.5.3.tar.gz
