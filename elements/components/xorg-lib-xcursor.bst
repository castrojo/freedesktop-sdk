kind: autotools
description: X.org lib Xcursor

(@):
- elements/include/cursorpath.yml

depends:
- public-stacks/runtime-minimal.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrender.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

variables:
  conf-local: |
    --with-cursorpath=%{cursorpath}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcursor.so'
  cpe:
    product: libxcursor

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcursor.git
  track: libXcursor-*
  ref: libXcursor-1.2.3-0-g8ae6cf61b18ecddf26f72a07bbfbd1ea9f022c36
