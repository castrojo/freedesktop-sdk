kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/flex.bst
- components/glib-stage1.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst
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
  ref: 1.84.0-0-gb45f51b000a5de089205d4552638f5fe66a71357
- kind: git_module
  url: gnome:gobject-introspection-tests.git
  path: gobject-introspection-tests
  ref: 82e531aa925683e30bf82790d47af181c4bb6876
