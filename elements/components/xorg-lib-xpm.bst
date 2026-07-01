# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: X.org lib xpm

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst

variables:
  conf-local: >-
    --disable-open-zfile

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXpm.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxpm.git
  track: libXpm-*
  ref: libXpm-3.5.19-0-g9a05472d7ebcdf6deaa970515f3ddba2b0fc265e
