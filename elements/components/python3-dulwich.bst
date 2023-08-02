kind: pyproject

sources:
- kind: git_repo
  url: github:jelmer/dulwich
  track: 'dulwich-*.*.*'
  ref: dulwich-0.21.5-0-g320cc2f16d8014a55381b7cbb69c508b520d94b6

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst


