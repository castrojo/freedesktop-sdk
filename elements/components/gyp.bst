kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-six.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/ninja.bst

sources:
- kind: git_tag
  url: chromium:external/gyp
  track: master
  track-tags: false
  ref: 9d09418933ea2f75cc416e5ce38d15f62acd5c9a
