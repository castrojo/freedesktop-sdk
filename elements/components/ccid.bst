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
  ref: 1.8.3-0-gc7852e45d7516b09bae863dfaf244faaf9117a54
