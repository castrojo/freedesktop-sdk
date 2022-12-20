kind: autotools
description: X.org xcb-util-image

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/xcb-util.bst
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
        - '%{libdir}/libxcb-image.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-image.git
  track: xcb-util-image-*
  ref: xcb-util-image-0.4.1-0-g525ce59fe2329d4b23fc0c52ed9dd92daac8ac2a
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
