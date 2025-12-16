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
  ref: 1.47-0-g88223018d1b578d0d8869866da66d9608e05f928
