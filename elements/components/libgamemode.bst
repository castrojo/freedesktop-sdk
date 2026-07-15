# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/gamemode-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/gamemode-manifest.bst
- components/libdbus.bst
- components/systemd-libs.bst

config:
  include:
  - libgamemode
  - gamemode-license
  include-orphans: False

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
