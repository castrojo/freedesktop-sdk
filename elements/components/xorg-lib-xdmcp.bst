kind: autotools
description: X.org lib xdmcp

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
        - '%{libdir}/libXdmcp.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxdmcp.git
  track: master
  ref: libXdmcp-1.1.5-0-g1192d3bc407348ff316bd3bffc791b3ac73f591b
