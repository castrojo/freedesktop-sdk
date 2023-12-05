kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst

depends:
- components/cairo.bst
- components/gtk3.bst
- components/pango.bst
- components/wayland.bst

variables:
  meson-local: >-
    -Ddemo=false
    -Ddbus=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdecor-0.so'

sources:
- kind: git_repo
  url: freedesktop:libdecor/libdecor.git
  track: '*.*.*'
  ref: 0.2.1-0-g060fe7611aedb5779929e6b1468419c2d4e7168f
