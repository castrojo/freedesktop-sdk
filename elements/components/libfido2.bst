# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/systemd-stage1.bst # Depends on udev

depends:
- components/libcbor.bst

variables:
  cmake-local: >-
    -DBUILD_STATIC_LIBS:BOOL=FALSE

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfido2.so'

sources:
- kind: git_repo
  url: github:Yubico/libfido2.git
  track: '*.*.*'
  ref: 1.17.0-0-gb974e7cf2ee7392134cc12c08b76a068cf250dd8
