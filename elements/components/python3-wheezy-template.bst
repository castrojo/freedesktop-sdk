kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '*.*.*'
  ref: 3.2.2-0-g4f24ba0d1b72acf292dcb895ccacc158e994eedc
