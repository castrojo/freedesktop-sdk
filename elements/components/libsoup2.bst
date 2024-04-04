kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/glib-networking.bst
- components/libxml2.bst
- components/sqlite.bst
- components/libpsl.bst
- components/brotli.bst

variables:
  meson-local: >
    -Dgssapi=disabled
    -Dvapi=disabled
    -Dntlm=disabled
    -Dsysprof=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsoup-2.4.so'
        - '%{libdir}/libsoup-gnome-2.4.so'

sources:
- kind: git_repo
  url: gnome:libsoup.git
  track: '2.[0-9][02468].*'
  ref: 2.72.0-0-gae1632c176c60b7fe832024c0a958f4079767c44
