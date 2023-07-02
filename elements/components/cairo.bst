kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/pixman.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/freetype.bst
- components/fontconfig.bst

variables:
  # We don't built libspectre and it would depend on ghostscript
  # our libbfd is doesn't have what's required for symbol-lookup
  # tests: tries to pull poppler-glib which causes a circular dep
  meson-local: >-
    -Dspectre=disabled
    -Dsymbol-lookup=disabled
    -Dtests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cairo-sphinx'
        - '%{bindir}/cairo-trace'
        - '%{libdir}/libcairo-script-interpreter.so'
        - '%{libdir}/libcairo-gobject.so'
        - '%{libdir}/libcairo.so'
        - '%{libdir}/cairo/libcairo-trace.so'

sources:
- kind: git_repo
  url: freedesktop:cairo/cairo.git
  track: 1.*[024678].*
  ref: 1.17.8-0-gc3b672634f0635af1ad0ffa8c15b34fc7c1035cf
