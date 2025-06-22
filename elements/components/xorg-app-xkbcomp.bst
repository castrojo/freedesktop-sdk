kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- components/flex.bst
- components/bison.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xkbfile.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/app/xkbcomp.git
  track: xkbcomp-*
  ref: xkbcomp-1.4.7-0-ge26102f28f08e5432b1ad44bbaef7f32aff199f6
