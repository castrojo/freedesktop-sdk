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
  ref: 2.19.1-0-gb583de4794e94b4dc4c2da03a7c29f462482293e
