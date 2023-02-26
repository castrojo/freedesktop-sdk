kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/shared-mime-info.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/libtiff.bst
- filename: components/libpng.bst
- filename: components/jpeg.bst
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: >
    -Dbuiltin_loaders=png,jpeg
    -Dinstalled_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gdk-pixbuf-csource'
        - '%{bindir}/gdk-pixbuf-pixdata'
        - '%{bindir}/gdk-pixbuf-thumbnailer'
        - '%{libdir}/libgdk_pixbuf-2.0.so'

    integration-commands:
    - |
      gdk-pixbuf-query-loaders --update-cache

sources:
- kind: git_repo
  url: gnome:gdk-pixbuf.git
  track: 2.*[02468].*
  ref: 2.42.8-0-gbca00032ad68d0b0aa2c1f7558db931e52bd9cd2
