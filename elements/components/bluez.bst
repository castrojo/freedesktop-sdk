kind: filter

build-depends:
- components/bluez-base.bst

runtime-depends:
- bootstrap-import.bst
- components/bluez-manifest.bst
- components/glib.bst
- components/dbus.bst
- components/libical.bst

config:
  exclude:
  - bluez-libs
  include-orphans: true
