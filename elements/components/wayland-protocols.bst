kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/wayland.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: freedesktop:wayland/wayland-protocols.git
  track: '*.*'
  ref: 1.39-0-g6bcf87d9c17a36bb56943efeb4cbb851bd3734b8
