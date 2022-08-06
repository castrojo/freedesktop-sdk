kind: filter

build-depends:
- components/bluez-base.bst

runtime-depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbluetooth.so'

config:
  include:
  - bluez-libs
