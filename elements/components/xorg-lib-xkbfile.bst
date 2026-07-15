# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbfile.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxkbfile.git
  track: libxkbfile-*
  ref: libxkbfile-1.2.0-0-g42e5dedd7fd3c7c73f3870a8751893c03c1afc69
