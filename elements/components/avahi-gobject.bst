kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- components/avahi.bst
- components/avahi-libs.bst
- components/pygobject.bst
- components/python3-dbus.bst

config:
  include:
  - gobject

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-gobject.so"
