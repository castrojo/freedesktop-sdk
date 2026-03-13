kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:tox-dev/filelock.git
  track: "*.*.*"
  ref: 3.25.2-0-g5b9872c523b20db569d8832da4fb640e9c175ce6
