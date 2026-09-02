kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gstreamer.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/gnutls.bst

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
  ref: 0.1.24-0-gaf62014d520ac09c8fe1974bda1b253114c68843
