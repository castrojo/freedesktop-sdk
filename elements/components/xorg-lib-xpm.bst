kind: autotools
description: X.org lib xpm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXpm.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxpm.git
  track: libXpm-*
  ref: libXpm-3.5.15-0-gddd8339e262cbb7b25993599299ad40e0c95ccf6
