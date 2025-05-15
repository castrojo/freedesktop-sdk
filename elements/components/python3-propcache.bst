kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst
- components/cython.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.3.1-0-g79088e6c9c5c1b5eae2be83dfe0cfc2315f8cc8e
- kind: patch
  path: patches/python3-propcache/relax-cython.patch
