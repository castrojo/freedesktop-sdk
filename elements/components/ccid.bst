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
  ref: 1.5.2-0-g9a7ad431a184771fdb7228da922c89daf5d55acb
  submodules:
    PCSC-contrib:
      url: https://salsa.debian.org/rousseau/PCSC-contrib.git
      checkout: true
    PCSC:
      url: https://salsa.debian.org/rousseau/PCSC.git
      checkout: true
