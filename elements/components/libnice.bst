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
  ref: 0.1.22-0-gae3eb16fd7d1237353bf64e899c612b8a63bca8a
