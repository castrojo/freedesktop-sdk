kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/wayland.bst

sources:
- kind: git_repo
  url: freedesktop:wayland/wayland-protocols.git
  track: '*.*'
  ref: 1.35-0-g08d1c7276d41379acfea353b5c739b72d51827e2
