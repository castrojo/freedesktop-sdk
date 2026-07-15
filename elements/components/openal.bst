# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libpulse.bst

variables:
  arch-conf: ''
  (?):
  - target_arch == "ppc64le":
      arch-conf: >-
        -DALSOFT_ENABLE_MODULES=OFF

  cmake-local: >-
    -DALSOFT_EXAMPLES=OFF
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/alrecord'
        - '%{bindir}/altonegen'
        - '%{bindir}/bsincgen'
        - '%{bindir}/makehrtf'
        - '%{bindir}/openal-info'
        - '%{libdir}/libopenal.so'

sources:
- kind: git_repo
  url: github:kcat/openal-soft.git
  track: '*.*.*'
  ref: 1.25.2-0-gb2c48f7718ef3fcf67921a8b6534c4914e328970
