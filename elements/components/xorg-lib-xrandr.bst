# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xrender.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrandr.so'
  cpe:
    product: libxrandr

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxrandr.git
  track: libXrandr-*
  ref: libXrandr-1.5.5-0-g540c3ceef2be3e513b18002a858c7a9591dd749a
