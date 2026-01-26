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
  ref: libXpm-3.5.18-0-g5b7e903025a8e162a3ee97c64304b1c55211094e
