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
  ref: 26.2-0-g84a87ee42483d7352f9502d78a9553da8859aa7a
