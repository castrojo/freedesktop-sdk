kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst

depends:
- components/jpeg.bst
- components/libpng.bst
- components/systemd-libs.bst
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
- kind: git_repo
  url: freedesktop:libinput/libinput.git
  track: '*.*.*'
  exclude:
  - "*.9??"
  ref: 1.29.1-0-gdc2c1ad181be88e1487468f7ca6f9d320981f133
