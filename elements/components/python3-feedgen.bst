kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-lxml.bst
- components/python3-dateutil.bst

sources:
- kind: git_repo
  url: github:lkiesow/python-feedgen.git
  track: 'v*'
  ref: v0.9.0-0-gffe3e4d752ac76e23c879c35682c310c2b1ccb86
