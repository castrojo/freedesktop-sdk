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
  ref: libSM-1.2.4-0-gdc882ac7b748048f12b033d0d8e5267a6e36036a
