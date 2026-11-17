# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libusb.bst
- components/systemd-libs.bst

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
  ref: hidapi-0.16.0-0-g750c87abb03282a237297052b84522e6bb3c0616
