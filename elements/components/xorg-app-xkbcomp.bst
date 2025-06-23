kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xkbfile.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/app/xkbcomp.git
  track: xkbcomp-*
  ref: xkbcomp-1.5.0-0-g2c7789785981ad1fce3858c726615b49293f7de0
