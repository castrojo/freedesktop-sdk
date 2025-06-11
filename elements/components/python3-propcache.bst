kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst
- components/cython-3.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.3.2-0-g1c609e54a57d8070a4a73a84567cc75a787cd000
