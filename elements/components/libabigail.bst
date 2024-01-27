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
  ref: libabigail-2.4-15-gf5c304427d6b8fa836eabe76c3c24df8dcc4e6e7
- kind: patch_queue
  path: patches/libabigail
