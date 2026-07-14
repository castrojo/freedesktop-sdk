# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

# This element is not be used directly. Use either:
#  - components/libgamemode.bst
#  - components/gamemode-daemon.bst

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
      find "%{install-root}" -name "lib*.a" -delete
    - |
      install -Dm644 -t "%{install-root}%{sysconfdir}" example/gamemode.ini

public:
  bst:
    split-rules:
      libgamemode:
      - '%{bindir}/gamemoderun'
      - '%{libdir}/libgamemode.so*'
      - '%{libdir}/libgamemodeauto.so*'
      - '%{libdir}/pkgconfig/gamemode.pc'
      - '%{libdir}/pkgconfig/libgamemodeauto.pc'
      - '%{includedir}/gamemode_client.h'
      - '%{debugdir}/dwz/%{stripdir-suffix}/*'
      - '%{debugdir}%{libdir}/libgamemode.so*'
      - '%{debugdir}%{libdir}/libgamemodeauto.so*'
      - '%{sourcedir}/**'
      gamemode-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"

  cpe:
    product: gamemode

sources:
- kind: git_repo
  url: github:FeralInteractive/gamemode.git
  track: '*.*'
  ref: 1.8.2-0-gc54d6d4243b0dd0afcb49f2c9836d432da171a2b
