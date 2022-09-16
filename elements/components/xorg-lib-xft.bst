kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrender.bst
- filename: components/freetype.bst
- filename: components/fontconfig.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXft.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxft.git
  track: master
  ref: libXft-2.3.6-0-g7d3bcd3b9ae3ffbfcd4f31c8f1db2254df90bc33
