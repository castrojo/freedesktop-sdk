kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

sources:
- kind: git_repo
  url: github:libusb/libusb.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.0.27-0-gd52e355daa09f17ce64819122cb067b8a2ee0d4b
