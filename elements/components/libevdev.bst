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
- kind: git_tag
  url: freedesktop:libevdev/libevdev.git
  track: master
  exclude:
  - 'libevdev-*.*.9*'
  ref: libevdev-1.13.0-0-gff4276398c9474f04bb1b8cb9f27e6163c5e040e
