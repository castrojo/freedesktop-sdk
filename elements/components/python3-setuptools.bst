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
  ref: v80.5.0-0-g18bfe51deb8479bfca40e326697a4f9c1b94521f
