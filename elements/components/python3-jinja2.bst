kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst

runtime-depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  ref:
    sha256sum: 0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d
    suffix: 
      df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz
