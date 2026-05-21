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
- kind: git_repo
  url: freedesktop:xorg/lib/libxi.git
  track: libXi-*
  exclude:
  - libXi-*.*.99.*
  ref: libXi-1.8.3-0-gf00f7e9140b4707775331950dd67851e55058c40
