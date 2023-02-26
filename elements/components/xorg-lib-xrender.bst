kind: autotools
description: X.org lib xrender

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
        - '%{libdir}/libXrender.so'
  cpe:
    product: libxrender

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxrender.git
  track: libXrender-*
  ref: libXrender-0.9.11-0-ge5e23272394c90731debd7e18dd167e8c25b5c15
