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
  ref: v17-0-g875f1d9060637e211823166049d56ef191900a5b
