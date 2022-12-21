kind: autotools
description: X.org lib SM

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-ice.bst
- filename: components/xorg-lib-xtrans.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSM.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libsm.git
  track: master
  ref: libSM-1.2.3-0-ga52c79544fcd6b5e2242b9122dfaa34be07aebb2
