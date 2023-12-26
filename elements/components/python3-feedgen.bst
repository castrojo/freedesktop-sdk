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
  ref: v1.0.0-0-g97260abb1793eb164c458c10b493690beb413f6d
