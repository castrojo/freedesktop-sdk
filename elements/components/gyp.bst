kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/ninja.bst
- components/python3-six.bst

sources:
- kind: git_repo
  url: chromium:external/gyp
  track: master
  ref-format: sha1
  ref: 1615ec326858f8c2bd8f30b3a86ea71830409ce4
