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
    -Dtests=false

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
        - '%{datadir}/wayland/wayland.dtd'

sources:
- kind: git_repo
  url: freedesktop:wayland/wayland.git
  track: '*.*.*'
  exclude:
  - '*.*.9*'
  ref: 1.23.1-0-ga9fec8dd65977c57f4039ced34327204d9b9d779

(@):
- elements/include/cursorpath.yml
