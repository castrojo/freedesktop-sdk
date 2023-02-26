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
- kind: git_repo
  url: freedesktop:xorg/proto/xcbproto.git
  track: xcb-proto-*
  ref: xcb-proto-1.15.2-0-ged461f379b6cde5bea7bc99d253c270b37298401
