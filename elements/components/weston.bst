kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/glslang.bst
- components/vulkan-headers.bst
- components/wayland-protocols.bst
- components/xcb-util-cursor.bst
- extensions/mesa/libdrm.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
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
- components/vulkan-icd-loader.bst

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
  ref: 15.0.0-0-gc9c305121cfb3427182eaf3761961094b1196b99
