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
  ref: 1.7.0-0-gae37104ee889634210f87ed5f0d7027846470866
