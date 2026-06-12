kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/perl.bst
- components/systemd.bst

depends:
- components/pcsc-lite.bst
- components/libusb.bst
- components/libfl.bst

sources:
- kind: git_repo
  url: github:LudovicRousseau/CCID.git
  track: '*.*.*'
  ref: 1.8.1-0-g01248eb121e4c3a188964cf8d0266529cc5fd3ee
