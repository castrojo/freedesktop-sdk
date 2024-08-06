kind: filter

build-depends:
- components/gamemode-base.bst

runtime-depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/systemd-libs.bst
- components/gamemode-manifest.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libgamemodeauto.so"
        - "%{libdir}/libgamemode.so"

config:
  include:
  - libgamemode
  include-orphans: False
