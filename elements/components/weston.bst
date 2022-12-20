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
  url: freedesktop:wayland/weston.git
  ref: 11.0.0-0-gd23a69272f544ee428ebbb597da09a82e084132c
