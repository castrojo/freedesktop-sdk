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
  ref: 1.33-0-g54346071a5f211f2c482889f2c8ee3b5ecda63ab
