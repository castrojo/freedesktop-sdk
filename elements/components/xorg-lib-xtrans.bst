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
  ref: xtrans-1.5.0-0-g3b3a3bd75d86aec78f6ef893b198c3efc378bc64
