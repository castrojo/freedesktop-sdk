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
  ref: 23.0-0-ge3f218269c0f2fd2aff228b310d7f474a3ffd487
