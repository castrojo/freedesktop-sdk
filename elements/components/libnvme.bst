kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/swig.bst

depends:
- components/json-c.bst
- components/keyutils.bst
- components/libdbus.bst
- components/openssl.bst

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
  ref: v1.6-0-g37a803cf77e224f66d86b1e1d9e74a15f55ea600
