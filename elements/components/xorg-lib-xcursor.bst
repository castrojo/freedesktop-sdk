# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib Xcursor

(@):
- elements/include/cursorpath.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xfixes.bst
- components/xorg-lib-xrender.bst

variables:
  conf-local: |
    --with-cursorpath=%{cursorpath}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcursor.so'
  cpe:
    product: libxcursor

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcursor.git
  track: libXcursor-*
  ref: libXcursor-1.2.3-0-g8ae6cf61b18ecddf26f72a07bbfbd1ea9f022c36
