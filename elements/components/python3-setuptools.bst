kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-wheel.bst

depends:
- bootstrap-import.bst
- components/python3.bst

config:
  build-commands:
    (<):
    # For reproducible builds
    - rm setup.cfg

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v80.8.0-0-gb3786cd9b59576907e671d8b22b66c73cfed5dc6
