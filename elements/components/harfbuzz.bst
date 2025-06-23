kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: 13.2.1-0-g6f4c5cec306d31e6822303f5ba248a14293d588e
