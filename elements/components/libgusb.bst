kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-setuptools.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- components/libusb.bst
- components/glib.bst
- components/vala.bst

sources:
- kind: git_tag
  url: github:hughsie/libgusb.git
  track: main
  ref: 0.3.10-0-g332d5b987ffecb824426e88518e05547faf2b520
