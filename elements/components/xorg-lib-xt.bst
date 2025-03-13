kind: autotools
description: X.org lib Xt

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-sm.bst
- filename: components/xorg-lib-ice.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXt.so'
  cpe:
    product: libxt

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxt.git
  ref: libXt-1.3.0-0-g64fca6a2d7cf4fee28ca2277ca6a8b7b32aee66e
