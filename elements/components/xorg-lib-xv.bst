kind: autotools
description: X.org lib xv

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
        - '%{libdir}/libXv.so'
  cpe:
    product: libxv

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxv.git
  track: libXv-*
  ref: libXv-1.0.12-0-gd419928942dbf1897c9627475aa4a2828a81240f
