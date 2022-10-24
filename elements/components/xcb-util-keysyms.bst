kind: autotools
description: X.org xcb-util-keysyms

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
        - '%{libdir}/libxcb-keysyms.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-keysyms.git
  track: master
  ref: xcb-util-keysyms-0.4.1-0-g85e093f14b0ade2956e0a5d1c37cfde06d8b1ba6
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
