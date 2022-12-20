kind: autotools
description: X.org lib Xxf86vm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXxf86vm.so'
  cpe:
    product: libxf86vm

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxxf86vm.git
  track: libXxf86vm-*
  ref: libXxf86vm-1.1.5-0-g7fe2d41f164d3015216c1079cc7fbce1eea90c98
