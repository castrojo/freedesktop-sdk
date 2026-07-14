# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/bluez-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/bluez-manifest.bst
- components/dbus.bst
- components/glib.bst
- components/libical.bst

config:
  exclude:
  - bluez-libs
  include-orphans: True

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/bluez"
    - "%{project_licensedir}/bluez/**"
