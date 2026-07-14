# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/cups-base.bst

runtime-depends:
- components/cups.bst

config:
  exclude:
  - cups-libs
  include-orphans: True

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/cups"
    - "%{project_licensedir}/cups/**"
