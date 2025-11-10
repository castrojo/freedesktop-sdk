kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libqrtr-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/libqrtr-glib.git
  track: '*.*.*'
  ref: 1.2.2-0-g8991f0e93713ebf4da48ae4f23940ead42f64c8c
