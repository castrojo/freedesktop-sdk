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
  ref: 1.43-0-g4313a51a170efffece8f60f7a5dfdad135e6befa
