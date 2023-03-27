kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/vala.bst
- components/help2man.bst

depends:
- components/glib.bst
- components/gnutls.bst
- components/gpgme.bst
- components/json-glib.bst
- components/libgusb.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:hughsie/libjcat.git
  track: '*.*.*'
  ref: 0.1.13-0-gf089d7ff9081bb6f211cdd712cddd159f8f63199
