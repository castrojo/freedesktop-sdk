kind: autotools
description: X.org xcb-util-renderutil

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xcb.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

variables:
  autogen: autoreconf -fvi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-render-util.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-render-util.git
  track: master
  ref: xcb-util-renderutil-0.3.10-0-g5293d8b6165f23b9f7a8bcc903da0e4d7a75984c
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
