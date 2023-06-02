kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst

depends:
- bootstrap-import.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dconfig-gnome=false
    -Dcurl=false
    -Dpacrunner-duktape=false
    -Dtests=false
    -Dvapi=false


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libproxy.so'

sources:
- kind: git_repo
  url: github:libproxy/libproxy.git
  track: '*.*.*'
  ref: 0.5.2-0-ge4f467b05c8adf25e5a2d5464914fc7e92bb7990
