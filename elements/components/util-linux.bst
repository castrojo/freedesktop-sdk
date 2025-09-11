kind: filter

build-depends:
- components/util-linux-base.bst

runtime-depends:
- bootstrap-import.bst

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
        - '%{libdir}/libsmartcols.so'
        - '%{libdir}/libmount.so'
        - '%{libdir}/libuuid.so'
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
