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
  ref: 0.3.15-0-g25a6384ad60f7e8550292e6cb4f262cc5da74be4
