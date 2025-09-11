kind: filter

build-depends:
- components/bluez-base.bst

runtime-depends:
- bootstrap-import.bst
- components/bluez-manifest.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbluetooth.so'
    overlap-whitelist:
    - "%{project_licensedir}/bluez"
    - "%{project_licensedir}/bluez/**"

config:
  include:
  - bluez-libs
  - bluez-license
