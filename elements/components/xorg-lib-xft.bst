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
- kind: git_repo
  url: freedesktop:xorg/lib/libxft.git
  track: libXft-*
  ref: libXft-2.3.7-0-g1463255cd4f537baabf8f2c65270e4924d4ed656
