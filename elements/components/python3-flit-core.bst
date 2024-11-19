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
  ref: 3.10.1-0-g7cc7d330d38d48ef865c07e5086a917278b19050
