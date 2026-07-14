# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/gamemode-base.bst

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

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/gamemode"
    - "%{project_licensedir}/gamemode/**"
