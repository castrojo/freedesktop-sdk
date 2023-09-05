kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gsettings-desktop-schemas.bst
- components/python3-gi-docgen.bst
- components/patchelf.bst
- components/vala.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/duktape.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dtests=false
    -Drelease=true

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
  ref: 0.5.9-0-g77e2a2b88a319974cf099c8eaaaa03030bc4c0d4
