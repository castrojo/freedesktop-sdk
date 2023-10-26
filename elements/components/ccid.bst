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
- kind: git_tag
  url: debian_salsa:rousseau/ccid.git
  track: master
  ref: 1.5.3-0-g440ab83fe437fbab3853de84fb2d86ec9939e5c4
- kind: git_module
  path: PCSC-contrib
  url: debian_salsa:rousseau/PCSC-contrib.git
  ref: deebf6fca223d799b19de3c359697bed7b694bf0
- kind: git_module
  path: PCSC
  url: debian_salsa:rousseau/PCSC.git
  ref: 601a3e9a9fb1a4826f9e521e4143fdda7ec00c13
