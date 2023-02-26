kind: autotools
description: X.org lib xtst

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXtst.so'
  cpe:
    product: libxtst

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxtst.git
  track: libXtst-*
  ref: libXtst-1.2.4-0-g99b89c3bcb0ebb0b6dd86bfdc9d276715eaea889
