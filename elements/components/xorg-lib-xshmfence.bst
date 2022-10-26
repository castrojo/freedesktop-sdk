kind: autotools
description: X.org lib xshmfence

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxshmfence.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxshmfence.git
  track: master
  ref: libxshmfence-1.3.1-0-g43749ba6a7631f5060ef85c93942ec32dfd39bf8
