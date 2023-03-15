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
  ref: v1.0.0-0-g4c9325f4e594bfc7178452d0d01eb8da6c3dbbdb
