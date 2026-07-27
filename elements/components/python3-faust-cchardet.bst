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
  ref: v3.0.0-0-gfeee03860fddb024fd907a088f1ae3b41e89a4a3
- kind: git_module
  path: src/ext/uchardet
  url: github:PyYoshi/uchardet.git
  ref: 06029ec3340cdf6bf9a6a537dafb3f39eda0560e
- kind: patch
  path: patches/python3-faust-cchardet/repro.patch
