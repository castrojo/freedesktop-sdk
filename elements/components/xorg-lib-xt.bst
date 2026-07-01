# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib Xt

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-ice.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXt.so'
  cpe:
    product: libxt

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxt.git
  track: libXt-*
  ref: libXt-1.3.1-0-g1dfcfa8dcc3958749849438a802d66728ccf3115
