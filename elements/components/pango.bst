kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
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
    -Dbuild-testsuite=false
    -Dbuild-examples=false

sources:
- kind: git_repo
  url: gnome:pango.git
  track: '*.*.*'
  ref: 1.57.1-0-g8f68873915b281ef5afcf0daa101d08047e305ba
