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
  ref: xtrans-1.5.1-0-gdf6ae7c7e0b6241a05ad2814bced637b00b1a83f
