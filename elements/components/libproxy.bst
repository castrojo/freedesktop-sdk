kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst
- components/patchelf.bst

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

config:
  install-commands:
    (>):
    - |
      patchelf --remove-rpath "%{install-root}%{libdir}/libproxy/libpxbackend-1.0.so"

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
  ref: 0.5.4-0-gdff9a603d823dcc740ec966cd27960daa6b891b1
