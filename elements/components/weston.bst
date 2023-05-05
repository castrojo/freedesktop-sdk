kind: meson

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst
- extensions/mesa/libdrm.bst

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
    -Dlauncher-libseat=false

  meson-lto-flags: ""

sources:
- kind: git_repo
  track: '*.*.*'
  exclude:
  - '*.*.9[0-9]'
  url: freedesktop:wayland/weston.git
  ref: 11.0.1-0-g783b144f2e1beff5848e6c76ab765c3ed32d5b77
