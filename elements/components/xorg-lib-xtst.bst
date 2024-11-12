kind: autotools
description: X.org lib xtst

depends:
- public-stacks/runtime-minimal.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXtst.so'
  cpe:
    product: libxtst

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxtst.git
  track: libXtst-*
  ref: libXtst-1.2.5-0-gabf3ff74b97c4231d2324d66318bfa1d22e44913
