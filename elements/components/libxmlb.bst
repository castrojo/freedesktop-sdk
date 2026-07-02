kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/diffutils.bst
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
  track: '*.*.*'
  ref: 0.3.28-0-g7a1b31db70bca83345de26219eb7e858cb85d321
