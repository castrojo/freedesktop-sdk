# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/geoclue-base.bst

runtime-depends:
- components/geoclue-libs.bst
- components/avahi-gobject.bst
- components/modemmanager.bst

config:
  exclude:
  - libgeoclue
  include-orphans: True

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/geoclue"
    - "%{project_licensedir}/geoclue/**"
