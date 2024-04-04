kind: autotools
description: X.org lib xdamage

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xfixes.bst
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
        - '%{libdir}/libXdamage.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxdamage.git
  track: libXdamage-*
  ref: libXdamage-1.1.6-0-g1f20df4fd7c132f55e924dc5ec3f270cd54704d0
