kind: autotools
description: X.org lib xinerama

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXinerama.so'
  cpe:
    product: libxinerama

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxinerama.git
  track: libXinerama-*
  ref: libXinerama-1.1.5-0-g71dfee64feb84f907016940263b235a61c9e8960
