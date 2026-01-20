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
  ref: v80.10.1-0-gadfb0c9e3d1789587d609228d9ea1d79272e4107
