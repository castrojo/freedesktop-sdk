kind: autotools
description: X.org xcb-util-cursor

(@):
- elements/include/cursorpath.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gperf.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
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
  ref: xcb-util-cursor-0.1.6-0-g7b0fa99aa13084a9bf7be4180066f6a74b0adef1
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: c617eee22ae5c285e79e81ec39ce96862fd3262f
