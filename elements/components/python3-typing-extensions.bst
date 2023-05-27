kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  ref: 4.6.2-0-ge84f909f6a9e8e03ef444a3a3c7e506e8e3b19e4
