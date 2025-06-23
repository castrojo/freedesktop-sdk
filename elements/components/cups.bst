kind: filter

build-depends:
- components/cups-base.bst

runtime-depends:
- components/avahi-libs.bst
- components/openssl.bst
- components/cups-manifest.bst

config:
  include:
  - cups-libs
  include-orphans: false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cups-config'
        - '%{libdir}/libcups.so'
        - '%{libdir}/libcupsimage.so'
