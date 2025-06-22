kind: autotools
description: X.org lib Xcomposite

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xfixes.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcomposite.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxcomposite.git
  track: libXcomposite-*
  ref: libXcomposite-0.4.6-0-gcecff847395deb553b6331f31776f9cbfc809add
