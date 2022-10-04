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
- kind: git_tag
  url: freedesktop:xorg/lib/libxau.git
  track: master
  ref: libXau-1.0.10-0-g4fbefa02d6c842401ff79065d364edd7087a12a6
