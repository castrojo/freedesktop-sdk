kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:akornatskyy/wheezy.template.git
  track: '*.*.*'
  ref: 3.2.4-0-g4f75fe4a83f0b9a32a8a7114eb7ae093b255dc97
