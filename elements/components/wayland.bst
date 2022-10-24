kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/expat.bst
- components/libxml2.bst
- components/libffi.bst

variables:
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
  ref: 1.20.0-0-g75c1a93e2067220fa06208f20f8f096bb463ec08
- kind: patch
  path: patches/wayland/Add-XDG_DATA_DIRS-to-xcursor-search-path.patch
