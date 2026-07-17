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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxmlb.so'

sources:
- kind: git_repo
  url: github:hughsie/libxmlb.git
  ref: 0.3.26-0-gf969b4dd491a7367f7500f55f576c810985363d7
