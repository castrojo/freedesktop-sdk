kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/freetype-stage1.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- components/glib.bst
- components/icu.bst
- components/graphite2.bst

variables:
  meson-local: >-
    -Dcairo=disabled
    -Dchafa=disabled
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
  ref: 8.5.0-0-g30485ee8c3d43c553afb9d78b9924cb71c8d2f19
