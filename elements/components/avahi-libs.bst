kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libdbus.bst

config:
  include:
  - libs
  - avahi-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-common.so"
        - "%{libdir}/libavahi-client.so"
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
