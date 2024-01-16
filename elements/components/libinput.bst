kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst

depends:
- components/jpeg.bst
- components/libpng.bst
- components/systemd.bst
- components/mtdev.bst
- components/libevdev.bst
- components/libwacom.bst

variables:
  meson-local: >-
    -Ddebug-gui=false
    -Ddocumentation=false
    -Dtests=false
    -Dzshcompletiondir=no

sources:
- kind: git_tag
  url: freedesktop:libinput/libinput.git
  track: main
  track-extra:
  - 1.20-branch
  exclude:
  - "*.9??"
  ref: 1.25.0-0-g3fd38d89276b679ac3565efd7c2150fd047902cb
