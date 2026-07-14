# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/dbus-base.bst

runtime-depends:
- components/dbus-manifest.bst
- components/expat.bst
- components/systemd-libs.bst

config:
  include:
  - dbus-libs
  - dbus-license
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdbus-1.so'
        - '%{libdir}/dbus-1.0/include'
        - '%{libdir}/dbus-1.0/include/**'
    overlap-whitelist:
    - "%{project_licensedir}/dbus"
    - "%{project_licensedir}/dbus/**"
