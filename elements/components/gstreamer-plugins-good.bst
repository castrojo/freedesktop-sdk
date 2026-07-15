# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/gstreamer-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/hotdoc.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/gdk-pixbuf.bst
- components/gstreamer-plugins-base.bst
- components/gstreamer.bst
- components/gtk3.bst
- components/jpeg.bst
- components/lame.bst
- components/libflac.bst
- components/libgudev.bst
- components/libpng.bst
- components/libpulse.bst
- components/libsoup.bst
- components/libvpx.bst
- components/mpg123.bst
- components/orc.bst
- components/speex.bst
- components/taglib.bst
- components/v4l-utils.bst
- components/wavpack.bst

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
    -Dtwolame=disabled
    -Dexamples=disabled
    -Drpicamsrc=disabled
    -Dximagesrc-navigation=disabled
    -Damrnb=disabled
    -Damrwbdec=disabled
    -Dximagesrc=disabled

public:
  cpe:
    product: gstreamer
