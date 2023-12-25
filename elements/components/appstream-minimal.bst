kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gperf.bst
- components/itstool.bst
- components/docbook-xsl.bst

depends:
- components/cairo.bst
- components/curl.bst
- components/fontconfig.bst
- components/freetype.bst
- components/gdk-pixbuf.bst
- components/glib.bst
- components/glib-networking.bst
- components/gobject-introspection.bst
- components/libyaml.bst
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

(@):
- elements/include/appstream-source.yml
