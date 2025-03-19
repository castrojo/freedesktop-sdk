kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

depends:
- components/pcsc-lite.bst
- components/libusb.bst
- components/libfl.bst

variables:
  conf-local: >-
    LEXLIB=""

sources:
- kind: git_repo
  url: debian_salsa:rousseau/ccid.git
  track: '*.*.*'
  ref: 1.6.2-0-g2044e518c42a630dda80d270e2c3dee8c6f42f2c
