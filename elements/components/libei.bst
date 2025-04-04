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
  exclude:
  - "*.*.90*"
  ref: 1.4.1-0-g9e0413cbc7d3ae6656266890425f152589ddf74d
