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
  ref: libXfixes-6.0.2-0-g70d5b0e37f8a759f3dbc218f22954347ceed094a
