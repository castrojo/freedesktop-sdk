kind: filter

build-depends:
- components/dbus-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libdbus.bst

config:
  include:
  - dbus-tools
  include-orphans: false
