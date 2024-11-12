kind: filter

build-depends:
- components/gamemode-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/gamemode-manifest.bst
- components/libgamemode.bst
- components/dbus.bst
- components/systemd-libs.bst

config:
  exclude:
  - libgamemode
  include-orphans: true
