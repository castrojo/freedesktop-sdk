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
  ref: 10.0.0-0-gd5261f7234ab072a2aa1758ccfe37372df9927a9
