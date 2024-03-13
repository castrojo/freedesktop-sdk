kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/flex.bst
- components/glib-stage1.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst

runtime-depends:
- components/python3-setuptools.bst # https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/395

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
  cpe:
    product: gobject-introspection

sources:
- kind: git_repo
  url: gnome:gobject-introspection.git
  track: "*.*[02468].*"
  ref: 1.80.0-0-g2f3fe819bbb5b3bce1462fe02405c2f9ffdce0d3
