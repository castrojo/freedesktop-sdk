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
  ref: 0.1.1-0-g4db201134ab51950a1c673d77d7c4f2f7c7b48fd
- kind: patch_queue
  path: patches/libdecor
