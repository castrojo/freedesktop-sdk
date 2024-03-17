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
- kind: git_repo
  url: freedesktop:xorg/lib/libxcursor.git
  track: libXcursor-*
  ref: libXcursor-1.2.2-0-g09617bcc9a0f1b5072212da5f8fede92ab85d157

(@):
- elements/include/cursorpath.yml
