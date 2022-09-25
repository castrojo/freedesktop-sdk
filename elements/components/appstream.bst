kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/itstool.bst

depends:
- components/cairo.bst
- components/curl.bst
- components/fontconfig.bst
- components/freetype.bst
- components/gdk-pixbuf.bst
- components/glib.bst
- components/glib-networking.bst
- components/gobject-introspection.bst
- components/gperf.bst
- components/libyaml.bst
- components/librsvg.bst
- components/libxml2.bst
- components/libxmlb.bst
- components/pango.bst

variables:
  meson-local: >-
    -Dstemming=false
    -Dcompose=true

sources:
- kind: git_tag
  url: github:ximion/appstream.git
  track: master
  ref: v0.15.5-0-g41e94d6a2ceb322250d718fcdea7a5cb53bc6416
