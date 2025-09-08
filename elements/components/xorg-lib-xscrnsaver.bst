kind: autotools
description: X.org lib XScrnSaver

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
        - '%{libdir}/libXss.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxscrnsaver.git
  track: libXScrnSaver-*
  ref: libXScrnSaver-1.2.5-0-g60c957ba8a727d01b376da0142aef7e18aa86fe1
