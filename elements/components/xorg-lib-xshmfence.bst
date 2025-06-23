kind: autotools
description: X.org lib xshmfence

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-proto-xorgproto.bst

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
