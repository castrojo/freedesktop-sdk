kind: pyproject

build-depends:
- components/python3-build-bootstrap.bst
- components/python3-installer.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-packaging.bst
- components/python3-pyproject-hooks.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/build.git
  track: '*.*.*'
  ref: 1.4.2-0-g7b7ae078aa1dabff33ea72d07ed15dd298acf80a
