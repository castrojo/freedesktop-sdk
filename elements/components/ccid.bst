kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/perl.bst
- components/systemd.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/pcsc-lite.bst
- components/libusb.bst
- components/libfl.bst

sources:
- kind: git_repo
  url: github:LudovicRousseau/CCID.git
  track: '*.*.*'
  ref: 1.7.1-0-g5850cb60a498623d5f9f6088987c1901b1a3405d
