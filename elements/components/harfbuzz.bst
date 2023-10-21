kind: autotools

depends:
- bootstrap-import.bst
- components/glib.bst
- components/icu.bst
- components/graphite2.bst

build-depends:
- components/freetype-stage1.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-autotools.bst
- components/gobject-introspection.bst

variables:
  conf-local: |
    --with-icu \
    --with-gobject \
    --with-graphite2

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
  ref: 8.2.2-0-g18a6e78549e8e04a281129ea8ca784ce85f111b8
