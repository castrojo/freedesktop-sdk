kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst
- components/gobject-introspection.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/glib-networking.bst
- components/libxml2.bst
- components/libnghttp2.bst
- components/sqlite.bst
- components/libpsl.bst
- components/brotli.bst

variables:
  meson-local: >
    -Dgssapi=disabled
    -Dvapi=disabled
    -Dntlm=disabled
    -Dsysprof=disabled
    -Dautobahn=disabled
    -Dhttp2_tests=disabled
    -Dpkcs11_tests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsoup-3.0.so'
        - '%{libdir}/libsoup-gnome-3.0.so'

sources:
- kind: git_repo
  url: gnome:libsoup.git
  track: '*.*.*'
  ref: 3.0.8-0-g66b1deac20ce3857d0c6cf225d4517027e532c0b
