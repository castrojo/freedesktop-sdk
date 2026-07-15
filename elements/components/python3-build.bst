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
  ref: 1.5.1-0-gd08fcd723500a7d676867144e1e7a22b650aeb7d
