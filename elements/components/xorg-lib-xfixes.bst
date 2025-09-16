kind: autotools
description: X.org lib xfixes

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

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
