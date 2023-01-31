kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst

depends:
- components/libusb.bst
- components/glib.bst
- components/json-glib.bst
- components/vala.bst

variables:
  meson-local: >-
    -Dumockdev=disabled

sources:
- kind: git_tag
  url: github:hughsie/libgusb.git
  track: main
  ref: 0.4.4-0-gbafd4d33dccc37c9fed220935f89f077cfaf2353
