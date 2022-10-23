kind: autotools
description: X.org xcb-util-wm

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
        - '%{libdir}/libxcb-ewmh.so'
        - '%{libdir}/libxcb-icccm.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-wm.git
  track: master
  ref: xcb-util-wm-0.4.2-0-g0c6681e465c9cc7b1fbb60778ba1eaa61ab01a14
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
