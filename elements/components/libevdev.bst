kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst
- components/python3.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

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
  ref: libevdev-1.13.6-0-g139b58e135184f66a35c2401771f3d8134f097ad
