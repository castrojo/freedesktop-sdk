kind: meson

(@):
- elements/include/cursorpath.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst
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
  ref: 1.24.0-0-g736d12ac67c20c60dc406dc49bb06be878501f86
