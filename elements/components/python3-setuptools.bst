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
  ref: v79.0.1-0-g607f6be776db97d83c9cc54e0eaa578567dcc44c
