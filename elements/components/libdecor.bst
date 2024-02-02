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
  ref: 0.2.2-0-g7807ae3480f5c6a37c5e8505d94af1e764aaf704
