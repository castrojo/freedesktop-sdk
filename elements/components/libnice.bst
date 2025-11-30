kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gstreamer.bst
  type: build
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnice.so'

variables:
  meson-local: >-
    -Dgupnp=disabled
    -Dexamples=disabled

sources:
- kind: git_repo
  url: freedesktop:libnice/libnice.git
  track: '*.*.*'
  ref: 0.1.23-0-g0a3890f1830d4c77ecbb41de835aa549e7645ed5
