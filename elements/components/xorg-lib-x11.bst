# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib x11

build-depends:
- components/perl.bst
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xtrans.bst
- components/xorg-lib-xcb.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libX11.so'
        - '%{libdir}/libX11-xcb.so'
  cpe:
    product: libx11

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libx11.git
  track: libX11-*
  ref: libX11-1.8.13-0-g6c75545a1deb51f5903992c52af6bc35cc9bc103
