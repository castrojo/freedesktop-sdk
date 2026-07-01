# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  util-linux libfdisk library.

  This element includes the 'libfdisk' library from util-linux, which is
  used by various system level projects like systemd and libblockdev, but
  is not used anywhere in the Flatpak app ecosystem.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/util-linux-manifest.bst
- public-stacks/runtime-minimal.bst

config:
  include:
  - libfdisk

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{libdir}/libfdisk.so'
