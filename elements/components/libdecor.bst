kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst

depends:
- components/cairo.bst
- components/pango.bst
- components/wayland.bst

variables:
  meson-local: >-
    -Ddemo=false
    -Ddbus=disabled
    -Dgtk=disabled

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
  ref: 0.2.0-0-gad320fc0e0ec2cd75a87fed454a9c7d6d1921464
