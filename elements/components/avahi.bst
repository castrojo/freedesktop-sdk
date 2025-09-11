kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- bootstrap-import.bst
- components/dbus.bst
- components/glib.bst
- components/systemd.bst

- components/libdaemon.bst
- components/xmltoman.bst

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
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
