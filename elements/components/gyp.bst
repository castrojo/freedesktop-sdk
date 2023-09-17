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
  ref: a03d7413becefc8d55c8aa3df58b55b9bd0e9052
