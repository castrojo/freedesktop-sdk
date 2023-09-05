kind: autotools
description: X.org lib xdamage

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-xfixes.bst
- components/xorg-lib-x11.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdamage.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxdamage.git
  track: libXdamage-*
  ref: libXdamage-1.1.6-0-g1f20df4fd7c132f55e924dc5ec3f270cd54704d0
