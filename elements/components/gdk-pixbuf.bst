kind: meson

build-depends:
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/python3-docutils.bst
- components/python3-gi-docgen.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/shared-mime-info.bst
- components/libtiff.bst
- components/libpng.bst
- components/jpeg.bst

variables:
  meson-local: >
    -Dbuiltin_loaders=png,jpeg
    -Dinstalled_tests=false
    -Dothers=enabled
    -Dtests=false
    -Dgtk_doc=true
    -Dman=true

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
  exclude:
  - '2.9*'
  ref: 2.42.12-0-ge4315fb8553776e13d39e3f2e0ea8792db61720c
