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
  ref: 1.13.0-0-g486a8f8667e42f55cee2bba301b41433cacec830
