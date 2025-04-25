kind: filter

build-depends:
- components/util-linux-base.bst

runtime-depends:
- bootstrap-import.bst
- components/util-linux-manifest.bst
- components/libeconf.bst
- components/sqlite.bst

config:
  exclude:
  - vm-tools
  include-orphans: true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libblkid.so'
        - '%{libdir}/libeconf.so'
        - '%{libdir}/liblastlog2.so'
        - '%{libdir}/libsmartcols.so'
        - '%{libdir}/libmount.so'
        - '%{libdir}/libuuid.so'
