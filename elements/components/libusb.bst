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
  ref: v1.0.28-0-ga61afe5f75d969c4561a1d0ad753aa23cee6329a
