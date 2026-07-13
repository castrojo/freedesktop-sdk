# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/avahi-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/dbus.bst
- components/glib.bst
- components/libdaemon.bst
- components/avahi-libs.bst
- components/avahi-manifest.bst

config:
  exclude:
  - libs
  - ui
  - gobject
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-core.so"
        - "%{libdir}/libavahi-glib.so"
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
