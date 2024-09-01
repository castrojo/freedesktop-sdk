kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:aio-libs/async-timeout.git
  track: v*
  exclude:
  - "*a*"
  ref: v4.0.3-0-ga48974404c746593f78c116faceb56a0db50309e
