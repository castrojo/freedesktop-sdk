# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/alsa-lib.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DWANT_PLAYER=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libWildMidi.so'

sources:
- kind: git_repo
  url: github:Mindwerks/wildmidi.git
  track: wildmidi-*
  ref: wildmidi-0.5.0-0-g340472ed4633d139d30c660b90eca03c1320e593
