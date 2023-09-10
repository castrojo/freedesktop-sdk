kind: pyproject

sources:
- kind: git_repo
  url: github:jelmer/dulwich
  track: 'dulwich-*.*.*'
  ref: dulwich-0.21.6-0-gdaf70786f929e3fd4995ad5d56bd93b437c20e5e

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst


