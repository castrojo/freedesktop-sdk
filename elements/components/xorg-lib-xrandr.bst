kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xrender.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrandr.so'
  cpe:
    product: libxrandr

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxrandr.git
  track: libXrandr-*
  ref: libXrandr-1.5.4-0-g512bf0b15b5597c721ff8c61083616ca9040fa72
