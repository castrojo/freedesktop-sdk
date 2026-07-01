# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/avahi-base.bst

runtime-depends:
- components/avahi.bst

config:
  include:
  - ui
  - avahi-license
  include-orphans: False

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
