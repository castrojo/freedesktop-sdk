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
  ref: v1.7-0-gf38b1d72e5077c827a3fdf8989dcc2dae70701d1
