kind: autotools
description: X.org proto xcb

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/proto/xcbproto.git
  ref: xcb-proto-1.14.1-0-g496e3ce329c3cc9b32af4054c30fa0f306deb007
