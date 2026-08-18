kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pygments/pygments.git
  track: refs/tags/*.*.*
  ref: 2.21.0-0-ga43b45dcf081b6010c6ab4428f149f7f6d2499c4
