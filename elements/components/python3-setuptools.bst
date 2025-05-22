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
  ref: v80.8.0-0-gb3786cd9b59576907e671d8b22b66c73cfed5dc6
- kind: patch
  path: patches/python3-setuptools/disable-coherent-license.patch
