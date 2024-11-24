kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.45.1-0-g7855525de4093257e7bfb434877265e227356566
