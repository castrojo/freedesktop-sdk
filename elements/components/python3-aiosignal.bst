kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-typing-extensions.bst

runtime-depends:
- components/python3-frozenlist.bst

sources:
- kind: git_repo
  url: github:aio-libs/aiosignal.git
  track: v*
  exclude:
  - "*a*"
  ref: v1.4.0-0-g1cf80149c869d410c90a58e85e9c703be6ef8692

