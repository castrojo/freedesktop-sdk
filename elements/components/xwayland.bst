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
- kind: git_repo
  url: freedesktop:xorg/xserver.git
  track: xwayland-*
  ref: xwayland-22.1.9-0-gf44cdcf4660ff70ee0dc9dc1f07ea31f8548837e
