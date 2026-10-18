kind: autotools
description: X.org lib x11

build-depends:
- components/perl.bst
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xtrans.bst
- components/xorg-lib-xcb.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libX11.so'
        - '%{libdir}/libX11-xcb.so'
  cpe:
    product: libx11

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libx11.git
  track: libX11-*
  ref: libX11-1.8.14-0-gb8d5a7046a98a244ee8ca3c9c07fd617c800dde2
