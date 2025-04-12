kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyCQA/pycodestyle.git
  track: '*.*.*'
  ref: '2.13.0-0-g3f52426121985a1717c214aeac47650d5c729621'
