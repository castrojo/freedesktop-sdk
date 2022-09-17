kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/font/util.git
  track: master
  ref: font-util-1.3.3-0-g2ef6b22ad908c024b6c2fbde5c1de62123f82dc2
