kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '0.1.167'
  ref: 0.1.167-0-g544b5e2a35536f647d409b0740a72adea6adf7aa
