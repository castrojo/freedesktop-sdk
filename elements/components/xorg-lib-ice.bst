kind: autotools
description: X.org lib ICE

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: components/xorg-lib-xtrans.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libICE.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libice.git
  track: libICE-*
  ref: libICE-1.1.2-0-gadf389fc19aedbf1be077b05365d164cd6f463d8
