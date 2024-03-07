kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/nasm.bst
- components/hotdoc.bst

depends:
- bootstrap-import.bst
- components/cairo.bst
- components/jpeg.bst
- components/orc.bst
- components/lame.bst
- components/libpng.bst
- components/libpulse.bst
- components/libsoup.bst
- components/libvpx.bst
- components/mpg123.bst
- components/gtk3.bst
- components/gdk-pixbuf.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/libflac.bst
- components/speex.bst
- components/wavpack.bst
- components/v4l-utils.bst
- components/libgudev.bst

variables:
  command-subdir: subprojects/gst-plugins-good

  meson-local: >-
    -Dpackage-origin="freedesktop-sdk"
    -Dv4l2-libv4l2=enabled
    -Dv4l2-gudev=enabled
    -Daalib=disabled
    -Djack=disabled
    -Dlibcaca=disabled
    -Ddv=disabled
    -Ddv1394=disabled
    -Dqt5=disabled
    -Dqt6=disabled
    -Dshout2=disabled
    -Dtaglib=disabled
    -Dtwolame=disabled
    -Dexamples=disabled
    -Drpicamsrc=disabled
    -Dximagesrc-navigation=disabled
    -Damrnb=disabled
    -Damrwbdec=disabled

public:
  cpe:
    product: gstreamer

(@):
- elements/include/gstreamer-source.yml
