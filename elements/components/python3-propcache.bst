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
  ref: v0.4.1-0-g410fc9318e12b70c15e21c70ab75256d1c7b3f41
- kind: patch
  path: patches/python3-propcache/reproducible.patch
