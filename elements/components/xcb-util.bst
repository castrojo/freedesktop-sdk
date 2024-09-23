kind: autotools
description: X.org xcb-util

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xau.bst
- filename: components/xorg-lib-xcb.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-util.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-util.git
  track: xcb-util-*
  ref: xcb-util-0.4.1-gitlab-0-gbffd8df1725c0fae9105a097e75b466e2f49d7bd
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
