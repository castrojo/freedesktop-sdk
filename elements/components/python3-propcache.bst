kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst
- components/cython.bst

runtime-depends:
- components/python3.bst

environment:
  PROPCACHE_BUILD_INPLACE: 'true'

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.5.4-0-gcc9882f95c6aadbfe7b88898e3f0230e4a38341a
