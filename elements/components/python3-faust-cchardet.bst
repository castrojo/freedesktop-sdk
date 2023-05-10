kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-pkgconfig.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:faust-streaming/cChardet.git
  track: '*.*.*'
  ref: v2.1.18-0-gb8f0d3b493830ced8ca2f8e4c686bbeda1f12f8e
- kind: git_module
  path: src/ext/uchardet
  url: github:PyYoshi/uchardet.git
  ref: bdb8a0376ddf5d3cab6397be0bad98dad106d77f
