# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/appstream-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst
- components/gperf.bst
- components/itstool.bst

depends:
- components/bash-completion.bst
- components/cairo.bst
- components/curl.bst
- components/fontconfig.bst
- components/freetype.bst
- components/gdk-pixbuf.bst
- components/glib-networking.bst
- components/glib.bst
- components/gobject-introspection.bst
- components/libfyaml.bst
- components/libxml2.bst
- components/libxmlb.bst
- components/pango.bst

variables:
  meson-local: >-
    -Dstemming=false
    -Dcompose=true
    -Dsvg-support=false
    -Dsystemd=false
    -Ddocs=false
    -Dapidocs=false
    -Dman=false
    -Dblake3-support=false
