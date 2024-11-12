kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/orc.bst

variables:
  command-subdir: subprojects/gst-plugins-ugly

  meson-local: >-
    -Dauto_features=disabled
    -Dasfdemux=enabled
    -Ddvdlpcmdec=enabled
    -Ddvdsub=enabled
    -Drealmedia=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"

public:
  cpe:
    product: gstreamer

(@):
- elements/include/gstreamer-source.yml
