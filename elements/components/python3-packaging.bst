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
  url: github:pypa/packaging.git
  track: '*.*'
  ref: 24.2-0-gd8e3b31b734926ebbcaff654279f6855a73e052f
