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
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-wm.git
  track: xcb-util-wm-*
  ref: xcb-util-wm-0.4.2-0-g0c6681e465c9cc7b1fbb60778ba1eaa61ab01a14
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
