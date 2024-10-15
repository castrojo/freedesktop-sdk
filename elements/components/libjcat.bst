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
  ref: 0.2.2-0-gfc04ad2d4e65e55024a4507e0aaa2659a0a588a3
