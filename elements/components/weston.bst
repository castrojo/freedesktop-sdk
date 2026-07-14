# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/glslang.bst
- components/vulkan-headers.bst
- components/wayland-protocols.bst
- components/xcb-util-cursor.bst
- extensions/mesa/libdrm.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/dummy-gbm.bst
- components/gstreamer-plugins-base.bst
- components/gstreamer.bst
- components/lcms.bst
- components/libdisplay-info.bst
- components/libdrm.bst
- components/libinput.bst
- components/libseat.bst
- components/libunwind.bst
- components/libva.bst
- components/libwebp.bst
- components/linux-pam.bst
- components/mtdev.bst
- components/pipewire.bst
- components/systemd-libs.bst
- components/vulkan-icd-loader.bst
- components/wayland.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xcursor.bst

environment:
  # FIXME, extract the required headers from libdrm that are needed
  PKG_CONFIG_PATH: '%{libdir}/GL/default/lib/pkgconfig:'

variables:
  meson-local: >-
    -Dbackend-rdp=false
    -Dbackend-vnc=false
    -Dtests=false
    -Dtest-junit-xml=false
    -Ddemo-clients=false
    -Dshell-lua=false

  meson-lto-flags: ""

sources:
- kind: git_repo
  track: '*.*.*'
  exclude:
  - '*.*.9[0-9]'
  url: freedesktop:wayland/weston.git
  ref: 15.0.1-0-ga4939fd123f509766e60b2d310d801b215c9822d
