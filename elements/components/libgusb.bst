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
- kind: git_repo
  url: github:hughsie/libgusb.git
  track: '*.*.*'
  ref: 0.4.8-0-gea074426660eb78199106767d826db9ea0fc8734
