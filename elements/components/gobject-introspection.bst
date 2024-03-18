kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/flex.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst


variables:
  meson-local: >-
    -Dcairo=disabled
    -Dgtk_doc=true
    -Ddoctool=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/gobject-introspection/giscanner'
        - '%{libdir}/gobject-introspection/giscanner/**'
        - '%{datadir}/gir-1.0'
        - '%{datadir}/gir-1.0/**'
        - '%{datadir}/gobject-introspection-1.0'
        - '%{datadir}/gobject-introspection-1.0/**'
        - '%{bindir}/g-ir-*'
        - '%{libdir}/libgirepository-1.0.so'

sources:
- kind: git_repo
  url: gnome:gobject-introspection.git
  track: "1.76.*"
  ref: 1.76.1-0-g1565805460c3fd65f8630debd0337ec0e33ee2e7
