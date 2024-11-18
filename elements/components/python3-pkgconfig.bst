kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:matze/pkgconfig.git
  track: v*
  ref: v1.5.5-0-g928418357bb5660919ac0e5979a8c32061bc0b7f
