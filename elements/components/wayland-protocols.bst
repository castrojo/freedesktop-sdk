kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: 1.49-0-gee78491a237eaff9389a0ccf8680521d074407d3
