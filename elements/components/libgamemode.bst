kind: filter

build-depends:
- components/gamemode-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
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
    overlap-whitelist:
    - "%{project_licensedir}/gamemode"
    - "%{project_licensedir}/gamemode/**"

config:
  include:
  - libgamemode
  - gamemode-license
  include-orphans: False
