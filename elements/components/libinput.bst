kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- components/jpeg.bst
- components/libpng.bst
- components/systemd-libs.bst
- components/mtdev.bst
- components/libevdev.bst
- components/libwacom.bst
- components/lua.bst

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
  ref: 1.31.0-0-g659967488e1e66d7fb7210c6b86860c8e1e5bed4
