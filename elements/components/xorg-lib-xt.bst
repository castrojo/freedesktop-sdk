kind: autotools
description: X.org lib Xt

depends:
- public-stacks/runtime-minimal.bst
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
  track: libXt-*
  ref: libXt-1.3.1-0-g1dfcfa8dcc3958749849438a802d66728ccf3115
