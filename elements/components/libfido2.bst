kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/systemd-stage1.bst # Depends on udev

depends:
- components/libcbor.bst

sources:
- kind: git_repo
  url: github:Yubico/libfido2.git
  track: '*.*.*'
  ref: 1.17.0-0-gb974e7cf2ee7392134cc12c08b76a068cf250dd8
