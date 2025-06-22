kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libdbus.bst

config:
  include:
  - libs

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-common.so"
        - "%{libdir}/libavahi-client.so"
