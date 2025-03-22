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
  ref: v77.0.3-0-g7c859e017368360ba66c8cc591279d8964c031bc
