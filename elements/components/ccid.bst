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
  ref: 1.8.0-0-gfe62e0d437b39bccbd35b0d509fb5758746740e0
