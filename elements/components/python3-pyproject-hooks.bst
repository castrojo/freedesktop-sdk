kind: pyproject

build-depends:
- components/python3-build-bootstrap.bst
- components/python3-flit-core.bst
- components/python3-installer.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/pyproject-hooks.git
  track: '*.*.*'
  ref: v1.3.3-0-g184c9f56a87ede1276a5b33f5024204adb792cd2
