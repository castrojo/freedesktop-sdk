kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst
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
  ref: 12.3.0-0-gb0af59229cc233a66106c696534ac39be56093d8
