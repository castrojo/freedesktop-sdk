kind: autotools
description: X.org lib Xcursor

depends:
- filename: bootstrap-import.bst
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
- kind: git_tag
  url: freedesktop:xorg/lib/libxcursor.git
  track: master
  ref: libXcursor-1.2.1-0-g27adb16027fa99d83818a0ed9f6623cb03f0c574

(@):
- elements/include/cursorpath.yml
