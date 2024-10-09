kind: filter

build-depends:
- components/lvm2-base.bst

runtime-depends:
- bootstrap-import.bst
- components/systemd-libs.bst

config:
  include:
  - libdevmapper
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        - '%{libdir}/libdevmapper.so'

