kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-frozenlist.bst

sources:
- kind: git_repo
  url: github:aio-libs/aiosignal.git
  track: v*
  exclude:
  - "*a*"
  ref: v1.3.2-0-gf90f6d41891d9982b90ef2d2eddd9b3e41a63526

