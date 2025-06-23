kind: autotools
description: X.org lib Xau

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
        - '%{libdir}/libXau.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxau.git
  track: libXau-*
  ref: libXau-1.0.12-0-ga9c65683e68b3a4349afee5d7673b393fb924d2e
