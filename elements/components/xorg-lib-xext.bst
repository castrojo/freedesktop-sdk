kind: autotools
description: X.org lib xext

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXext.so'
  cpe:
    product: libxext

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxext.git
  track: libXext-*
  ref: libXext-1.3.5-0-g67e82cc395f44faddd83ec3d0d21624fe91c6fc0
