kind: autotools
description: X.org lib XScrnSaver

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
        - '%{libdir}/libXss.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxscrnsaver.git
  track: libXScrnSaver-*
  ref: libXScrnSaver-1.2.4-0-g34f3f72b88c0a0a10d618e9dfbc88474ae5ce880
