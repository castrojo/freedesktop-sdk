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
  - cups-license
  include-orphans: false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cups-config'
        - '%{libdir}/libcups.so'
        - '%{libdir}/libcupsimage.so'
    overlap-whitelist:
    - "%{project_licensedir}/cups"
    - "%{project_licensedir}/cups/**"
