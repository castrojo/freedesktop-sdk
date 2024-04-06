kind: meson

build-depends:
- bootstrap-import.bst
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
- components/systemd.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xcursor.bst
- components/mtdev.bst
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
  url: freedesktop:wayland/weston.git
  ref: 13.0.0-0-g712cdc56ab7eab5f11f4934e04904a6d01a07733
