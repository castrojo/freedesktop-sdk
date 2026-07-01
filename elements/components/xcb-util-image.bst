# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org xcb-util-image

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xcb.bst
- components/xcb-util.bst

variables:
  autogen: autoreconf -fvi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-image.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-image.git
  track: xcb-util-image-*
  ref: xcb-util-image-0.4.1-gitlab-0-g1abfc17b1e08e46dbdf34b4ef36097a8c307a8ec
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
