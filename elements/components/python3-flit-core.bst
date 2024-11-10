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
  ref: 3.9.0-0-gc8ae08dc9f3f067feeec9dfd2c443db592f4d3d1
