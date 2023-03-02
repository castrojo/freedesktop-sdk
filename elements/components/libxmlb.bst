kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- components/glib.bst
- components/zstd.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:hughsie/libxmlb.git
  track: '*.*.*'
  ref: 0.3.11-0-g6191220071233972d798b57841d08e4964952a17
