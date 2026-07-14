# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/gstreamer-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/hotdoc.bst
- components/wayland-protocols.bst

depends:
- public-stacks/runtime-minimal.bst
- components/alsa-lib.bst
- components/gdk-pixbuf.bst
- components/graphene.bst
- components/gstreamer.bst
- components/gtk3.bst
- components/iso-codes.bst
- components/jpeg.bst
- components/libdrm.bst
- components/libogg.bst
- components/libpng.bst
- components/libtheora.bst
- components/libvorbis.bst
- components/mesa-headers.bst
- components/opus.bst
- components/orc.bst
- components/pango.bst
- components/wayland.bst
- components/xorg-lib-xv.bst

variables:
  command-subdir: subprojects/gst-plugins-base
  gl-api: opengl,gles2

  (?):
  - target_arch == "i686":
      gl-api: opengl

  meson-local: >-
    -Dgl_api=%{gl-api}
    -Dgl_platform=egl,glx
    -Dgl-graphene=enabled
    -Dgl-png=enabled
    -Dgl-jpeg=enabled
    -Dintrospection=enabled
    -Dpackage-origin="freedesktop-sdk"
    -Dcdparanoia=disabled
    -Dlibvisual=disabled
    -Dtremor=disabled
    -Dexamples=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstfft-1.0.so'
        - '%{libdir}/libgstrtp-1.0.so'
        - '%{libdir}/libgstsdp-1.0.so'
        - '%{libdir}/libgstvideo-1.0.so'
        - '%{libdir}/libgstapp-1.0.so'
        - '%{libdir}/libgstriff-1.0.so'
        - '%{libdir}/libgstrtsp-1.0.so'
        - '%{libdir}/libgstallocators-1.0.so'
        - '%{libdir}/libgsttag-1.0.so'
        - '%{libdir}/libgstaudio-1.0.so'
        - '%{libdir}/libgstpbutils-1.0.so'
        - '%{libdir}/libgstgl-1.0.so'
        - '%{libdir}/gstreamer-1.0/include'
        - '%{libdir}/gstreamer-1.0/include/**'
  cpe:
    product: gstreamer
