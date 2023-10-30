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
  ref: 1.5.4-0-gb688eae34d17a9a96f8df1d382dd0688b6bc0b66
- kind: git_module
  path: PCSC-contrib
  url: debian_salsa:rousseau/PCSC-contrib.git
  ref: deebf6fca223d799b19de3c359697bed7b694bf0
- kind: git_module
  path: PCSC
  url: debian_salsa:rousseau/PCSC.git
  ref: 549922c1355fdd1e85eb0a952fefda7bb96e286a
