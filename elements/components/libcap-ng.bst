# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap-ng.so'
        - '%{libdir}/libdrop_ambient.so'

sources:
- kind: git_repo
  url: github:stevegrubb/libcap-ng.git
  track: v*
  ref: v0.9.6-0-gc382c641ca5730442289c09d3c3d30cc2c8635a9
