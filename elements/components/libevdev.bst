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
  ref: libevdev-1.13.4-0-gac0056961c3332a260db063ab4fccc7747638a1d
