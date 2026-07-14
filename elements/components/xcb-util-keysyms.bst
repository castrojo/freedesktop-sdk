# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org xcb-util-keysyms

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xcb.bst

variables:
  autogen: autoreconf -fvi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-keysyms.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-keysyms.git
  track: xcb-util-keysyms-*
  ref: xcb-util-keysyms-0.4.1-0-g85e093f14b0ade2956e0a5d1c37cfde06d8b1ba6
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
