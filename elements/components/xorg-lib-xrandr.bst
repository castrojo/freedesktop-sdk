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
  ref: libXrandr-1.5.3-0-g3387129532899eaeee3477a2d92fa662d7292a84
