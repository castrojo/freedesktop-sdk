kind: autotools
description: X.org lib xinerama

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXinerama.so'
  cpe:
    product: libxinerama

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxinerama.git
  track: libXinerama-*
  ref: libXinerama-1.1.6-0-gcc4ac9cf36fdf3815381b791e47a90b8aebc7e78
