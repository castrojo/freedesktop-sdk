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
  ref: v1.3.1-0-g2b8907dc15f976d3747a16bd65f1681ae54249a3

