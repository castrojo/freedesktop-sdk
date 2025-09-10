kind: filter

build-depends:
- components/util-linux-base.bst

runtime-depends:
- components/util-linux-manifest.bst
- public-stacks/runtime-minimal.bst
- components/libeconf.bst
- components/file.bst
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
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
