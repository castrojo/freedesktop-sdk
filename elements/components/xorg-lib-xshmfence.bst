kind: autotools
description: X.org lib xshmfence

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxshmfence.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxshmfence.git
  track: libxshmfence-*
  ref: libxshmfence-1.3.3-0-g89f064748554e11832a3ec783945e1f4c7fe846e
