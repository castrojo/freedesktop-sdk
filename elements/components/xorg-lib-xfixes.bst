kind: autotools
description: X.org lib xfixes

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
        - '%{libdir}/libXfixes.so'
  cpe:
    product: libxfixes

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxfixes.git
  track: libXfixes-*
  ref: libXfixes-6.0.1-0-gc1cab28e27dd1c5a81394965248b57e490ccf2ca
