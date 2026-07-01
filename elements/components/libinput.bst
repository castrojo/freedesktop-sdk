# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  ref: 1.31.3-0-g26191d396d74d505541d6311f0b4ae68d791b890
