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
  ref: libXdmcp-1.1.4-0-g7f5677e87df575298f62320d76408823b54cd883
