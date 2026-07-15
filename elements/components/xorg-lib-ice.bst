# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib ICE

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xtrans.bst
- components/xorg-proto-xorgproto.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libICE.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libice.git
  track: libICE-*
  ref: libICE-1.1.2-0-gadf389fc19aedbf1be077b05365d164cd6f463d8
