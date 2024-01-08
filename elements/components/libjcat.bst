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
  ref: 0.2.0-0-g60bb85d53d5da74903ab1e227fbecfa3a3be1b05
