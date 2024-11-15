kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/dbus.bst
- components/glib.bst
- components/libdaemon.bst
- components/avahi-manifest.bst

config:
  exclude:
  - ui
  - gobject
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-client.so"
        - "%{libdir}/libavahi-common.so"
        - "%{libdir}/libavahi-core.so"
        - "%{libdir}/libavahi-glib.so"
