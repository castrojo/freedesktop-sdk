kind: autotools
description: X.org lib xpm

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
        - '%{libdir}/libXpm.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxpm.git
  track: libXpm-*
  ref: libXpm-3.5.14-0-g08bc174f28af028b6ebaa9edeccd3ff56c396e92
