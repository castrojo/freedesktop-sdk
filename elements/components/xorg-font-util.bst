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
  ref: font-util-1.4.0-0-geee69c3f26f8e5d7f97599185d8d009f7fd76a7c
