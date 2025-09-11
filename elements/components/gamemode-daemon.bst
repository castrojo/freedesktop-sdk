kind: filter

build-depends:
- components/gamemode-base.bst

runtime-depends:
- bootstrap-import.bst
- components/gamemode-manifest.bst
- components/libgamemode.bst
- components/dbus.bst
- components/systemd-libs.bst

config:
  exclude:
  - libgamemode
  include-orphans: true

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/gamemode"
    - "%{project_licensedir}/gamemode/**"
