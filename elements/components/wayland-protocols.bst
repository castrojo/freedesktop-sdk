kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/wayland.bst

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland-protocols.git
  track: main
  ref: 1.32-0-g681c33c8547d6aefe24455ba2bffe1c5ae11fee5
