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
  ref: 0.3.19-0-g4393955fb7c8bbcb6a2c65ff54f16c39dc165e59
