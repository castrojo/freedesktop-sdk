kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3.bst
- components/ninja.bst
- components/python3-six.bst

sources:
- kind: git_repo
  url: chromium:external/gyp
  track: master
  ref: 1615ec326858f8c2bd8f30b3a86ea71830409ce4
