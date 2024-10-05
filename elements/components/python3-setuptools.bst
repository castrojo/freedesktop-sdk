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
  ref: v78.1.0-0-g6ead555c5fb29bc57fe6105b1bffc163f56fd558
