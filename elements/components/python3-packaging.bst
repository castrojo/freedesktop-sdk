kind: pyproject

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    python3 -mflit_core.wheel

sources:
- kind: git_repo
  url: github:pypa/packaging.git
  track: '*.*'
  ref: 25.0-0-gf58537628042c7f29780b9d33f31597e7fc9d664
