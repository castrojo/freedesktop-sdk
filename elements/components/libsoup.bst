kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst
- components/gobject-introspection.bst
- components/python3.bst
- components/python3-gi-docgen.bst

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
  track: 3.[02468].*
  ref: 3.2.2-0-g49e0178c6f91725ca348acf6d3c5d1343e6c9eb1
