kind: autotools
description: X.org lib Xcomposite

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

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
  ref: libXcomposite-0.4.7-0-ga6d5d773e2a4e5a11b58f3a894f2085686baa6f4
