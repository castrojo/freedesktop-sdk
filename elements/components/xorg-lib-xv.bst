kind: autotools
description: X.org lib xv

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
        - '%{libdir}/libXv.so'
  cpe:
    product: libxv

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxv.git
  track: libXv-*
  ref: libXv-1.0.13-0-ge1cde54538060c4fd3a3d02e3d2e2b7e5da7bff9
