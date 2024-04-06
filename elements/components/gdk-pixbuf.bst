kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-docutils.bst

depends:
- bootstrap-import.bst
- components/jpeg.bst
- components/libpng.bst
- components/libtiff.bst
- components/shared-mime-info.bst

variables:
  meson-local: >
    -Dbuiltin_loaders=png,jpeg
    -Dinstalled_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gdk-pixbuf-csource'
        - '%{bindir}/gdk-pixbuf-pixdata'
        - '%{bindir}/gdk-pixbuf-thumbnailer'
        - '%{libdir}/libgdk_pixbuf-2.0.so'

    integration-commands:
    - |
      gdk-pixbuf-query-loaders --update-cache

sources:
- kind: git_repo
  url: gnome:gdk-pixbuf.git
  track: '2.*[02468].*'
  ref: 2.42.10-0-g9ac257eb38f772fec4253e8051743029e75a2acd
