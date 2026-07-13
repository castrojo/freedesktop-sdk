# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/hwdata.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/di-edid-decode'
        - '%{libdir}/libdisplay-info.so'

sources:
- kind: git_repo
  track: '*.*.*'
  url: freedesktop:emersion/libdisplay-info.git
  ref: 0.3.0-0-g47a5590e9c4eb35d67651b8c05a55f1a48259329
