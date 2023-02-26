kind: autotools
description: X.org lib xinerama

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
        - '%{libdir}/libXinerama.so'
  cpe:
    product: libxinerama

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxinerama.git
  track: libXinerama-*
  ref: libXinerama-1.1.5-0-g71dfee64feb84f907016940263b235a61c9e8960
