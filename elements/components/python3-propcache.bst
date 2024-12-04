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
  ref: v0.2.1-0-g24fd58a10551ec8e8db66d8612e10455774ca3aa
