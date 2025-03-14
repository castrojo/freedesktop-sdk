kind: autotools
description: X.org lib xtrans

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxtrans.git
  track: xtrans-*
  ref: xtrans-1.6.0-0-gcf05ba4a10c90da2c63805a5375e983b174e28b0
