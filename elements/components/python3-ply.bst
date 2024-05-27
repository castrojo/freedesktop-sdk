kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:dabeaz/ply.git
  track: '*.*'
  ref: 3.11-0-g0f398b72618c1564d71f7dc0558e6722b241875a
