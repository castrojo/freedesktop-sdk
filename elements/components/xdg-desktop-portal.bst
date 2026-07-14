# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/xdg-desktop-portal-base.bst

runtime-depends:
- components/flatpak.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue-libs.bst
- components/glib.bst
- components/libgudev.bst
- components/pipewire-daemon.bst
- components/xdg-desktop-portal-manifest.bst
- components/xdg-portal-interfaces.bst

config:
  include-orphans: True
  exclude:
  - interfaces

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/xdg-desktop-portal"
    - "%{project_licensedir}/xdg-desktop-portal/**"
