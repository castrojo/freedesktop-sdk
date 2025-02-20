kind: pyproject

build-depends:
- components/python3-build-bootstrap.bst
- components/python3-installer-bootstrap.bst

depends:
- components/python3.bst

variables:
  command-subdir: flit_core
  strip-binaries: ''

config:
  build-commands:
    # Unvendoring
    (<):
    - rm -r flit_core/vendor

sources:
- kind: git_repo
  url: github:pypa/flit.git
  track: '*.*.*'
  ref: 3.11.0-0-g5f8c75fba2f926036da6188ab8b59524ea4859f3
