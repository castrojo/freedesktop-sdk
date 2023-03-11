kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/ninja.bst
- components/python3-six.bst

sources:
- kind: git_tag
  url: chromium:external/gyp
  track: master
  track-tags: false
  ref: c6d8b9f7ee355cff1531b0f369cd338a50baeb07
