kind: autotools
description: X.org lib pciaccess

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpciaccess.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libpciaccess.git
  ref: libpciaccess-0.16-0-gfbd1f0fe79ba25b72635f8e36a6c33d7e0ca19f6
