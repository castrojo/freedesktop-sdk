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
  ref: 0.4.6-0-g03ba6c83de960fbe5aad13a0d0e2d16e2eca771a
