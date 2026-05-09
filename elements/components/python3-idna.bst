kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.13-0-g89cdfd27338896cee6b1ee18e64c96ac28684ce0
- kind: patch
  path: patches/python3-idna/relax-flit-core.patch
