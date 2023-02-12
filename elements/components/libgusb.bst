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
- kind: git_repo
  url: github:hughsie/libgusb.git
  track: '*.*.*'
  ref: 0.4.5-0-gcfe6865211bc241fe5e10b999bc0e27e7bddcb84
