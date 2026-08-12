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
  ref: v3.2.0-0-ged6369d1b0714ca075dd0554dd860667078d0d61
- kind: git_module
  path: src/ext/uchardet
  url: github:PyYoshi/uchardet.git
  ref: 06029ec3340cdf6bf9a6a537dafb3f39eda0560e
- kind: patch
  path: patches/python3-faust-cchardet/repro.patch
- kind: patch
  path: patches/python3-faust-cchardet/0001-Revert-packaging-version-constraint.patch
