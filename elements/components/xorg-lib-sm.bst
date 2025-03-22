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
- kind: git_repo
  url: freedesktop:xorg/lib/libsm.git
  track: libSM-*
  ref: libSM-1.2.6-0-g5f6da959a34bcefc425b6e37462553acf44369a3
