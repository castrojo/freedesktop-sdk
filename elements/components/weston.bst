kind: meson

build-depends:
- public-stacks/runtime-minimal.bst
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst
- extensions/mesa/libdrm.bst
- components/xcb-util-cursor.bst

depends:
- components/libunwind.bst
- components/linux-pam.bst
- components/cairo.bst
- components/libdrm.bst
- components/wayland.bst
- components/systemd-libs.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xcursor.bst
- components/mtdev.bst
- components/libdisplay-info.bst
- components/libinput.bst
- components/dummy-gbm.bst
- components/libwebp.bst
- components/libva.bst
- components/libseat.bst
- components/lcms.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/pipewire.bst

environment:
  # FIXME, extract the required headers from libdrm that are needed
  PKG_CONFIG_PATH: '%{libdir}/GL/default/lib/pkgconfig:'

variables:
  meson-local: >-
    -Dbackend-rdp=false
    -Dbackend-vnc=false

  meson-lto-flags: ""

sources:
- kind: git_repo
  track: '*.*.*'
  exclude:
  - '*.*.9[0-9]'
  url: freedesktop:wayland/weston.git
  ref: 14.0.2-0-g015b3b4d4c05da44a22349ea6e651d1a8f678c59
