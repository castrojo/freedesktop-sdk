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
  ref: 1.3.0-0-g997b7c0f37faea4f8bae59613c8f27370925d5b0
