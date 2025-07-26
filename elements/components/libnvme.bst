kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/swig.bst

depends:
- components/json-c.bst
- components/keyutils.bst
- components/libdbus.bst
- components/openssl.bst

variables:
  meson-local: >-
    -Dliburing=disabled

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
  ref: v1.15-0-ga6497f6e8cb3bc3607e4a772b648a7887b0ab875
