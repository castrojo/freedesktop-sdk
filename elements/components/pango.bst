kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/python3-gi-docgen.bst

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
    -Ddocumentation=true
    -Dintrospection=enabled
    -Dbuild-testsuite=false
    -Dbuild-examples=false

sources:
- kind: git_repo
  url: gnome:pango.git
  track: '*.*.*'
  ref: 1.56.0-0-g941aeab7a30c2b99e96e8b9fd449d65688b63db8
