kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  ref: 4.5.0-0-g8dcd89993c3926d6c704232b9c56160447fa81fe
