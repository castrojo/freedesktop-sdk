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
- kind: git_tag
  url: freedesktop:xorg/lib/libpciaccess.git
  track: master
  ref: libpciaccess-0.17-0-g935f0b4d6983f77c4f35e6d492f9f2c2d1ed57f9
