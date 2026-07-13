# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/avahi-base.bst

runtime-depends:
- components/avahi.bst
- components/avahi-libs.bst
- components/pygobject.bst
- components/python3-dbus.bst

config:
  include:
  - gobject
  - avahi-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-gobject.so"
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
