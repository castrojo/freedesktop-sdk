# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib XScrnSaver

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXss.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxscrnsaver.git
  track: libXScrnSaver-*
  ref: libXScrnSaver-1.2.5-0-g60c957ba8a727d01b376da0142aef7e18aa86fe1
