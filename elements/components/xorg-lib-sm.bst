kind: autotools
description: X.org lib SM

depends:
- public-stacks/runtime-minimal.bst
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
- kind: git_repo
  url: freedesktop:xorg/lib/libsm.git
  track: libSM-*
  ref: libSM-1.2.5-0-g83644d01d64a93a1fc463affc8bd9b30dc023a83
