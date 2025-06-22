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
  ref: 0.1.22-0-gae3eb16fd7d1237353bf64e899c612b8a63bca8a
