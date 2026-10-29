# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DINSTALL_LIBDIR=%{libdir}

sources:
- kind: git_repo
  url: github:EHfive/ldacBT
  track: 'v*'
  ref: v2.0.2.6-0-g6579bd585a618f2e1612b3c1650d2b7fcfb1d43f
- kind: git_module
  url: android:platform/external/libldac
  path: libldac
  ref: 82b6a1abee84787b8fa167efe20290073f60db2d
