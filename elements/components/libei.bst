kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/systemd-libs.bst
- components/python3-attrs.bst
- components/python3-jinja2.bst
- components/libevdev.bst
- components/libxkbcommon.bst

variables:
  meson-local: >-
    -Dtests=disabled

sources:
- kind: git_repo
  url: freedesktop:libinput/libei.git
  track: "*.*"
  ref: 1.0.901-0-g8713ef2d6348d1ebc04a17d9b2e4eb7d6fe13761
