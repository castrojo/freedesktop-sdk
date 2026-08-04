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
  exclude:
  - "*rc*"
  ref: 26.3-0-g929fd4b1410ac7ef61ef3f45b2f5d7e87711a9b5
