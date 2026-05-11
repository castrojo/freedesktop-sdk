kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:kjd/idna.git
  track: v*
  ref: v3.14-0-g37b6b7497aee4805f7a74a7d86206ac05be9669a
