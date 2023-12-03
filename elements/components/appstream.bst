kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/gperf.bst
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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libappstream-compose.so'
        - '%{libdir}/libappstream.so'
        - '%{bindir}'
        - '%{bindir}/**'


(@):
- elements/include/appstream-source.yml
