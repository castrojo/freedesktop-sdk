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
  ref: 0.3.24-0-gd004cca465e5c5af3ce02c02a15978ff02b510c3
