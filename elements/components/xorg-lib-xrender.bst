kind: autotools
description: X.org lib xrender

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
        - '%{libdir}/libXrender.so'
  cpe:
    product: libxrender

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxrender.git
  track: libXrender-*
  ref: libXrender-0.9.12-0-g46e12ff9e8e4d3f0313a2f097df93dbfdc14f92f
