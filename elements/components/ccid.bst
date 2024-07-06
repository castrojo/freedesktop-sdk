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
  ref: 1.6.1-0-gf869c9b0a1c5642024fc6e26b81cba752d43c123
