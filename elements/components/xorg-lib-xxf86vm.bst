kind: autotools
description: X.org lib Xxf86vm

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

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
  ref: libXxf86vm-1.1.6-0-g4f7497ee3b0deb0418ce48dcd862fd6c23e20064
