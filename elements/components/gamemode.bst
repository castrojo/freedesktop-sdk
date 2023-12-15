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
- kind: git_tag
  url: github:FeralInteractive/gamemode.git
  track: master
  ref: 1.8.1-0-g5180d89e66830d87f69687b95fb86f622552b94b
