kind: autotools
description: X.org xcb-util-cursor

depends:
- filename: bootstrap-import.bst
- filename: components/xcb-util-renderutil.bst
- filename: components/xcb-util-image.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/gperf.bst
  type: build

variables:
  autogen: autoreconf -fvi
  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-cursor.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-cursor.git
  track: master
  ref: xcb-util-cursor-0.1.4-0-g3d7e713e85af18d7e52cafdc9d20a2715048dee7
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
