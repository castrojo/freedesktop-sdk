kind: meson

build-depends:
- components/doxygen.bst
- components/python3.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Ddocumentation=enabled

sources:
- kind: git_repo
  url: freedesktop:libevdev/libevdev.git
  track: libevdev-*
  exclude:
  - 'libevdev-*.*.9*'
  ref: libevdev-1.13.5-0-gf3a9c2038d54c95abedc58df2ff16738da355289
