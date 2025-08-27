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
  ref: 1.5.0-0-g19b64535408aa47abbc8151bc2c925afd6583851
