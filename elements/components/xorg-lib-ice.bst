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
  ref: libICE-1.1.1-0-gbe1888a46e446dfcaa62ac0a97d96bb77b6816d4
