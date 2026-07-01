# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/systemd-libs.bst
- components/libusb.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhidapi-hidraw.so'
        - '%{libdir}/libhidapi-libusb.so'

sources:
- kind: git_repo
  url: github:libusb/hidapi.git
  track: hidapi-*
  exclude:
  - "*rc*"
  ref: hidapi-0.15.0-0-gd6b2a974608dec3b76fb1e36c189f22b9cf3650c
