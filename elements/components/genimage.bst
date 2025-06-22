kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libconfuse.bst

runtime-depends:
- components/e2fsprogs.bst
- components/mtools.bst
- components/dosfstools.bst

sources:
- kind: git_repo
  url: github:pengutronix/genimage.git
  track: v*
  ref: v18-0-g00009af6e29cfd46909bc8b4180147dda9f82ba8
