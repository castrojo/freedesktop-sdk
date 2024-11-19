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
  ref: 10.1.0-0-g9ef44a2d67ac870c1f7f671f6dc98d08a2579865
