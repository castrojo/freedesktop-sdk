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
  ref: 2d207fd1699c88dcf6dfdd819d940c0dd227ffe7
