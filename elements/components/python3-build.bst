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

sources:
- kind: git_repo
  url: github:pypa/build.git
  track: '*.*.*'
  ref: 1.2.2.post1-0-g2f667024a90718da24c5bdfdb264944436adf82e
