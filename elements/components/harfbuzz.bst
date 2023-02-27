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
  ref: 7.0.1-0-g1d1f93a612ed071b703abab7deb0951f46a12433
