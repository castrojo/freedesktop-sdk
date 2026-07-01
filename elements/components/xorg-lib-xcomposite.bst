# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib Xcomposite

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xfixes.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcomposite.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcomposite.git
  track: libXcomposite-*
  ref: libXcomposite-0.4.7-0-ga6d5d773e2a4e5a11b58f3a894f2085686baa6f4
