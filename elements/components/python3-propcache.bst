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
  ref: v0.5.1-0-g9c374aa535fc054676ed84b4e709b8a29cb9a60c
- kind: patch
  path: patches/python3-propcache/allow-cython.patch
