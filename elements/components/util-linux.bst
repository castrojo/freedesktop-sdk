# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  util-linux utilities and internal libraries.

  This element includes utility programs that are used by libraries and apps in
  the Flatpak ecosystem.

  It also includes libraries that are used only by the util-linux programs:

    * liblastlog2
    * libsmartcols

  These libraries are installed system-wide and are available to other apps
  and libraries, but we didn't see any example so far of them being used
  in the Flatpak ecosystem. Publicly used libraries are in the separate
  `components/util-linux-libs.bst` element.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/ncurses.bst
- components/file.bst
- components/libeconf.bst
- components/sqlite.bst
- components/util-linux-libs.bst
- components/util-linux-manifest.bst

config:
  exclude:
  - libblkid
  - libfdisk
  - libmount
  - libuuid
  - vm-tools
  include-orphans: True

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblastlog2.so'
        - '%{libdir}/libsmartcols.so'
