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
  ref: 1.2.1-0-g08f1d41085a6ae4bac7bc52abe2955d3354342cb
