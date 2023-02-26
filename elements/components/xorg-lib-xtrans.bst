kind: autotools
description: X.org lib xtrans

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxtrans.git
  track: xtrans-*
  ref: xtrans-1.4.0-0-gc4262efc9688e495261d8b23a12f956ab38e006f
