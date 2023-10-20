kind: autotools
description: X.org xcb-util-cursor

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- components/gperf.bst

depends:
- bootstrap-import.bst
- components/xcb-util-renderutil.bst
- components/xcb-util-image.bst

variables:
  # Various files like shape_to_id.gperf get generated in wrong path
  # with build-dir
  build-dir: ''
  autogen: autoreconf -fvi
  conf-local: |
    --with-cursorpath=%{cursorpath}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-cursor.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcb-cursor.git
  track: xcb-util-cursor-*
  ref: xcb-util-cursor-0.1.5-0-gc393b71fff76fe8627d0e95c53e756615f84d7a3
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f

(@):
- elements/include/cursorpath.yml
