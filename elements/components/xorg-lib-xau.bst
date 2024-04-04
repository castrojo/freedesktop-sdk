kind: autotools
description: X.org lib Xau

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXau.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxau.git
  track: libXau-*
  ref: libXau-1.0.11-0-g14fdf25db9f21c8f3ad37f0d32a5b8e726efdc0d
