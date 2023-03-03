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
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dstemming=false
    -Dcompose=true

(@):
- elements/include/appstream-source.yml
