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
  ref: xtrans-1.5.2-0-g0dc46e7ed5bdd876467f9dbb314ba6b8094e541b
