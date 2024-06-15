kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/python3-gi-docgen.bst

depends:
- bootstrap-import.bst
- components/cairo.bst
- components/harfbuzz.bst
- components/fontconfig.bst
- components/fribidi.bst
- components/json-glib.bst
- components/libthai.bst
- components/xorg-lib-xft.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'
        - '%{libdir}/libpangoxft-1.0.so'

  cpe:
    ignored:
    - CVE-2019-1010238

variables:
  meson-local: >-
    -Ddocumentation=false
    -Dintrospection=enabled
    -Dinstall-tests=false

sources:
- kind: git_repo
  url: gnome:pango.git
  track: '*.*.*'
  ref: 1.54.0-0-g5b1551e933d069d15169eb7c8bd6b2e95cbfe230
