kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:eliben/pyelftools
  track: 'v*.*'
  ref: v0.30-0-gb5840ce74154391bf48eff4473128cc245a55505
