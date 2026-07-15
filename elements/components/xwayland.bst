# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst
- components/xorg-proto-xorgproto.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/dummy-gbm.bst
- components/libdrm.bst
- components/libei.bst
- components/libepoxy.bst
- components/libtirpc.bst
- components/nettle.bst
- components/pixman.bst
- components/systemd-libs.bst
- components/wayland.bst
- components/xorg-app-xkbcomp.bst
- components/xorg-font-util.bst
- components/xorg-lib-xcvt.bst
- components/xorg-lib-xdmcp.bst
- components/xorg-lib-xfont2.bst
- components/xorg-lib-xkbfile.bst
- components/xorg-lib-xshmfence.bst

variables:
  meson-local: >-
    -Dxvfb=false
    -Dxwayland_ei=portal

sources:
- kind: git_repo
  url: freedesktop:xorg/xserver.git
  track: xwayland-*
  exclude:
  - '*.99.*'
  ref: xwayland-24.1.13-0-gc5a47fda896aeefbf1d06a73e392a294344f9e1a
