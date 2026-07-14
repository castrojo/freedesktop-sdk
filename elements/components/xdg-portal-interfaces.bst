# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/xdg-desktop-portal-base.bst

runtime-depends:
- components/xdg-desktop-portal-manifest.bst

config:
  include:
  - interfaces
  - xdp-license

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/xdg-desktop-portal"
    - "%{project_licensedir}/xdg-desktop-portal/**"
