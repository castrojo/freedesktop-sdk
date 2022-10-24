kind: autotools
description: X.org lib xi

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

variables:
  conf-local: |
    --disable-specs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXi.so'
  cpe:
    product: libxi

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxi.git
  ref: libXi-1.7.10-0-ge05da79a98775edb91ffe3de3b413f156bc4d6e7
