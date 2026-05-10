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
  ref: v0.5.2-0-g041f7afe0dff07f3baa77ff444dd735433290940
- kind: patch
  path: patches/python3-propcache/relax-cython.patch
- kind: patch
  path: patches/python3-propcache/reproducible.patch
