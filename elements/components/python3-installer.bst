kind: pyproject

build-depends:
- components/python3-build-bootstrap.bst
- components/python3-flit-core.bst
- components/python3-installer-bootstrap.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/installer.git
  track: '*.*.*'
  ref: 0.7.0-0-gb1d39180f8548820d09ce992dfadff0a42242c48
- kind: patch
  path: patches/python3-installer/reproducible_record.patch
