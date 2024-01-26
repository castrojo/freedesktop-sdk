kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: master
  ref: libabigail-2.4-13-g2f038ab3d4a09aac180ead71780c055c11ecb928
- kind: patch_queue
  path: patches/libabigail
