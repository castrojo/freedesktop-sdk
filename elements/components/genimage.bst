kind: autotools

depends:
- bootstrap-import.bst
- components/libconfuse.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

runtime-depends:
- components/e2fsprogs.bst
- components/mtools.bst
- components/dosfstools.bst

sources:
- kind: git_tag
  url: github:pengutronix/genimage.git
  track: master
  ref: v16-0-g5bbb4d14cccec19e4177604d1473be2e2a167b5f
