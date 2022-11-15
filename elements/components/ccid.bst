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
  ref: 1.5.1-0-g64a1780ac6b9947223a7d65c363556f2aed8d4c9
  submodules:
    PCSC-contrib:
      url: https://salsa.debian.org/rousseau/PCSC-contrib.git
      checkout: true
    PCSC:
      url: https://salsa.debian.org/rousseau/PCSC.git
      checkout: true
