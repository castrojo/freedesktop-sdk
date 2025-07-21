kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/freetype-stage1.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/icu.bst
- components/graphite2.bst

variables:
  meson-local: >-
    -Dcairo=disabled
    -Dchafa=disabled
    -Dgraphite2=enabled
    -Dtests=disabled

  target_flags_exceptions: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libharfbuzz-*.so'
        - '%{libdir}/libharfbuzz.so'

sources:
- kind: git_repo
  url: github:harfbuzz/harfbuzz.git
  track: '*.*.*'
  ref: 11.3.2-0-g4e3df1c1383481ed5717603d5dd3453a04fb16ba
