kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:python-attrs/attrs.git
  track: '*.*.*'
  ref: 24.1.0-0-g556ca7c919fb22c1327a096a3d99493a7bb48bdc
