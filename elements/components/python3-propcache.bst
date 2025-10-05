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
  ref: v0.4.0-0-g146520e7ef68317ee0a3eafd9e7732c819fac956
- kind: patch
  path: patches/python3-propcache/relax-cython.patch
- kind: patch
  path: patches/python3-propcache/reproducible.patch
