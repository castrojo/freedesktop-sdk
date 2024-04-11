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
  ref: 0.5.3-0-g29d51a611f28af0bdbd51a5779cc8df264c8dcff
