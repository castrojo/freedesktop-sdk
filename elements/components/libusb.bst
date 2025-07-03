kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libusb-1.0.so'

sources:
- kind: git_repo
  url: github:libusb/libusb.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.0.29-0-g15a7ebb4d426c5ce196684347d2b7cafad862626
