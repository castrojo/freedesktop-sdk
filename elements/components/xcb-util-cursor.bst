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
    --with-cursorpath=~/.icons:/app/share/icons:%{datadir}/icons:%{datadir}/pixmaps:%{datadir}/runtime/share/icons:/run/host/user-share/icons:/run/host/share/icons

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
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
