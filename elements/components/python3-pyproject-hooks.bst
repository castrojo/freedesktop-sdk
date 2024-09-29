kind: pyproject

build-depends:
- components/python3-flit-core.bst
- components/python3-installer.bst

config:
  build-commands:
  - python3 -mflit_core.wheel

sources:
- kind: git_repo
  url: github:pypa/pyproject-hooks.git
  track: '*.*.*'
  ref: v1.2.0-0-g4b7c6d113fb89b755d762a88712c8a6873cddd47
