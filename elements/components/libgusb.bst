kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-gi-docgen.bst
- components/python3-setuptools.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- components/libusb.bst
- components/glib.bst
- components/json-glib.bst
- components/vala.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:hughsie/libgusb.git
  track: '*.*.*'
  ref: 0.4.7-0-g94f907cbf150eea97c7a44caaade35b0af5707a3
