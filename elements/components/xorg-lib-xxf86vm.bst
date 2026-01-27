kind: autotools
description: X.org lib Xxf86vm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXxf86vm.so'
  cpe:
    product: libxf86vm

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxxf86vm.git
  track: libXxf86vm-*
  ref: libXxf86vm-1.1.7-0-g7f200bf00e3e288e47265c01decc401616c57f10
