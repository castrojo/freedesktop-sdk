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
  ref: libXrender-0.9.13-0-gf30d654658ebf17d41141ed3ec2abf607d8a512e
