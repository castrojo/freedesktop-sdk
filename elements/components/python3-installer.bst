kind: pyproject

build-depends:
- components/python3-flit-core.bst

depends:
- components/python3.bst

environment:
  PYTHONPATH: "%{build-root}/src"

config:
  build-commands:
  - |
    python3 -mflit_core.wheel

sources:
- kind: git_repo
  url: github:pypa/installer.git
  track: '*.*.*'
  ref: 0.6.0-0-ge9c3b3b052d39c3030c0f792ed4e0311b7468329
