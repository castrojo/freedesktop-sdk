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
  ref: 0.3.14-0-gaa577b276adc66564f5777f9a522ca3bf0bfa65e
