kind: filter

build-depends:
- components/bluez-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/bluez-manifest.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbluetooth.so'

config:
  include:
  - bluez-libs
