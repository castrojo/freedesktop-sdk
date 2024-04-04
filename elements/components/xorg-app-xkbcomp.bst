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
  ref: xkbcomp-1.4.7-0-ge26102f28f08e5432b1ad44bbaef7f32aff199f6
