kind: autotools
description: X.org lib xtst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xi.bst

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
