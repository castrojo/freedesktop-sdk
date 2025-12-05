kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xkbfile.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/app/xkbcomp.git
  track: xkbcomp-*
  ref: xkbcomp-1.5.0-0-g2c7789785981ad1fce3858c726615b49293f7de0
