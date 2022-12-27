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
  ref: 0.4.3-0-gf79cb57e03a7111bde4c019ca3132160bbe97d3e
