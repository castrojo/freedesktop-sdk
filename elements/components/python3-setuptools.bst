kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- public-stacks/runtime-minimal.bst
- components/python3.bst

config:
  build-commands:
    (<):
    # For reproducible builds
    - rm setup.cfg

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v76.0.0-0-gc11a4940deba04a6f8f8e1410686116f587f6f70
