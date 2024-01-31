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
  ref: 2d207fd1699c88dcf6dfdd819d940c0dd227ffe7
