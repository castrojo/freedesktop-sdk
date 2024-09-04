kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/dbus.bst
- components/inih.bst

variables:
  meson-local: >-
    -Dwith-sd-bus-provider=systemd
    -Dwith-examples=false
    -Dwith-util=true

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"
    - |
      install -Dm644 -t "%{install-root}%{sysconfdir}" example/gamemode.ini

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libgamemodeauto.so"
        - "%{libdir}/libgamemode.so"
        - "%{libdir}/libinih.so"
        - "%{libdir}/libINIReader.so"

sources:
- kind: git_repo
  url: github:FeralInteractive/gamemode.git
  track: '*.*.*'
  ref: 1.8.2-0-gc54d6d4243b0dd0afcb49f2c9836d432da171a2b
