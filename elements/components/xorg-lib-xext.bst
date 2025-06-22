kind: autotools
description: X.org lib xext

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst

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
  ref: libXext-1.3.6-0-g3826a58d190c2d8093d3586cb33867668cbb4553
