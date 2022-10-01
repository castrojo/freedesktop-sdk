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
  ref: 0.4.1-0-ge510a4126b7ab7f53848c2e44ff1e37fc59b932c
