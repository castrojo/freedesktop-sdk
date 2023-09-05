kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst
- components/cython.bst
- components/gcc.bst
- components/stripper.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.2.0-0-gf157b0a7b0b3a3c755764b9f03f4d90c43ee5cda
