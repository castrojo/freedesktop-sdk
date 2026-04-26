kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/font/util.git
  track: font-util-*
  ref: font-util-1.4.2-0-g5c92c11482e017fa7210a71b6f44e40042816209
