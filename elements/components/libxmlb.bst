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
- kind: git_tag
  url: github:hughsie/libxmlb.git
  track: main
  ref: 0.3.12-0-g5bafa30bac46366da53d152ac72b787b8367d5f2
