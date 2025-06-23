kind: meson_recc

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/diffutils.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/help2man.bst
- components/vala.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: 0.2.5-0-g8b4336b0df0b00e66129535f1f15eb3862641816
