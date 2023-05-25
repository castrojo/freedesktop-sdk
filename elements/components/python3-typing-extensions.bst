kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python/typing_extensions.git
  track: '*.*.*'
  ref: 4.6.1-0-gf62fa3f37ce1949e8a536691b30c59c4889445eb
