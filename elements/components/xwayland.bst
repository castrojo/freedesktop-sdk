kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-proto-xorgproto.bst
- components/xorg-util-macros.bst
- components/wayland-protocols.bst


depends:
- bootstrap-import.bst
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

variables:
  meson-local: >-
    -Dxvfb=false

sources:
- kind: git_tag
  url: freedesktop:xorg/xserver.git
  track: master
  track-extra:
  - xwayland-22.1
  match:
  - xwayland-*
  ref: xwayland-22.1.7-0-gef2e1be3fbbfe9e89010dfe9c3ac4e50b7eec161
