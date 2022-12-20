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
  ref: 9d09418933ea2f75cc416e5ce38d15f62acd5c9a
