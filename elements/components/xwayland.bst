kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-proto-xorgproto.bst
- components/xorg-util-macros.bst
- components/wayland-protocols.bst


depends:
- public-stacks/runtime-minimal.bst
- components/nettle.bst
- components/libtirpc.bst
- components/libdrm.bst
- components/dummy-gbm.bst
- components/libepoxy.bst
- components/pixman.bst
- components/xorg-lib-xcvt.bst
- components/xorg-lib-xkbfile.bst
- components/xorg-lib-xfont2.bst
- components/xorg-lib-xdmcp.bst
- components/xorg-lib-xshmfence.bst
- components/xorg-app-xkbcomp.bst
- components/xorg-font-util.bst
- components/wayland.bst
- components/systemd.bst
- components/libei.bst

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
  ref: xwayland-24.1.4-0-g3bfef8d7c06ca6a380b1e23ca5ec0675a302cc90
