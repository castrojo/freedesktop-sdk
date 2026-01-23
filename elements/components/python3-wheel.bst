kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pypa/wheel.git
  track: '*.*.*'
  ref: 0.46.3-0-g8b6fa740a7101edacb42b0f8e83a1b659ff61033
