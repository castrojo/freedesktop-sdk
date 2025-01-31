kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/wayland.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: freedesktop:wayland/wayland-protocols.git
  track: '*.*'
  ref: 1.40-0-gc7b582cb71ec145026a547dcd8abb9dfeba40541
