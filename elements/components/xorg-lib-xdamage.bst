# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib xdamage

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xfixes.bst
- components/xorg-lib-x11.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdamage.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxdamage.git
  track: libXdamage-*
  ref: libXdamage-1.1.7-0-g4ff0f0e76c974faf920e476abccc65a4990a637c
