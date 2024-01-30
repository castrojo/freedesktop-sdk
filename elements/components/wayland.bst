kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/expat.bst
- components/libxml2.bst
- components/libffi.bst

variables:
  local_flags: -DXCURSORPATH='"%{cursorpath}"'
  meson-local: >-
    -Ddocumentation=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/wayland-scanner'
        - '%{libdir}/libwayland-client.so'
        - '%{libdir}/libwayland-cursor.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libwayland-server.so'

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland.git
  track: main
  exclude:
  - '*.*.9*'
  ref: 1.21.0-0-g8135e856ebd79872f886466e9cee39affb7d9ee8

(@):
- elements/include/cursorpath.yml
