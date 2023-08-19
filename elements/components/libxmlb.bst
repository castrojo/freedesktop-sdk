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
  ref: 0.3.13-0-g3be2235c9be79c0ece789d3d50c52c15be31829d
