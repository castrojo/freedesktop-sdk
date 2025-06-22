kind: autotools
description: X.org lib xdmcp

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-proto-xorgproto.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdmcp.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxdmcp.git
  track: libXdmcp-*
  ref: libXdmcp-1.1.5-0-g1192d3bc407348ff316bd3bffc791b3ac73f591b
