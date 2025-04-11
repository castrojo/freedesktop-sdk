kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/swig.bst

depends:
- components/json-c.bst
- components/keyutils.bst
- components/libdbus.bst
- components/openssl.bst
- components/liburing.bst

variables:
  meson-local: >-
    -Dliburing=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnvme.so'
        - '%{libdir}/libnvme-mi.so'

sources:
- kind: git_repo
  url: github:linux-nvme/libnvme.git
  track: 'v*'
  exclude:
  - 'v*-rc*'
  ref: v1.13-0-g4727ac4fd97e893c74286281ecc997e44b7fa4b9
