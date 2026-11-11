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
  ref: 1.1.0-0-g509a9b7160decebe9aa0aff429c12837346c86ef
# - kind: patch
#   path: patches/python3-installer/reproducible_record.patch
