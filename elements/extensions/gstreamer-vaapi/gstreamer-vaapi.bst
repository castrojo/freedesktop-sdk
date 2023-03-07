kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/wayland-protocols.bst

depends:
- bootstrap-import.bst
- components/gstreamer.bst
- components/gstreamer-plugins-bad.bst
- components/libdrm.bst
- components/libva.bst
- components/wayland.bst
- components/xorg-lib-x11.bst


variables:
  command-subdir: subprojects/gstreamer-vaapi

  meson-local: >-
    -Ddrm=enabled
    -Dencoders=enabled
    -Degl=enabled
    -Dglx=enabled
    -Dwayland=enabled
    -Dx11=enabled
    -Ddoc=disabled
    -Dtests=disabled
    -Dexamples=disabled

(@):
- elements/include/gstreamer-source.yml
