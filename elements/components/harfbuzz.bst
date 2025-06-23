kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- (@): include/_private/gcc-for-recc.yml

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
    -Dgpu_demo=disabled

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
  ref: 14.1.0-0-gcfb70b0b91af933a08339c7c8eef459df1098d7b
