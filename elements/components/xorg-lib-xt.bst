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
  ref: libXt-1.2.1-0-gedd70bdfbbd16247e3d9564ca51d864f82626eb7
