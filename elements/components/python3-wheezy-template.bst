kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '*.*.*'
  ref: 3.2.6-0-g11e731d43f3670e56baf950d56aa18791e54a71c
