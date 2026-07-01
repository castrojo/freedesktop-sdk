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
  ref: v0.9.3-0-g0ab44af5a23e8edb69a39c0dc803ce4395ff2086
