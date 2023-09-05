kind: filter

build-depends:
- components/lvm2-base.bst

runtime-depends:
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

config:
  include:
  - libdevmapper
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        - '%{libdir}/libdevmapper.so'

