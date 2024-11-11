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
  track: xcb-proto-1.16.*
  ref: xcb-proto-1.16.0-0-g98eeebfc2d7db5377b85437418fb942ea30ffc0d
