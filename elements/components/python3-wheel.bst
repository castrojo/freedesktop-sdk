kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.48.0-0-g21c4da4c54c3b354cc22dc7f6f6374ffcd560e84
