# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libeconf.so'

sources:
- kind: git_repo
  url: github:openSUSE/libeconf.git
  track: v*
  ref: v0.8.6-0-g9f43b3480209272e4f4992129cca7a40b3e496e9
