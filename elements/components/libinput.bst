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
  exclude:
  - "*.9??"
  ref: 1.22.0-0-gfc59e574e050c502c9a3adefacf97babf3d09c7a
