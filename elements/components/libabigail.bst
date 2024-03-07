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
  ref: libabigail-2.4-41-g908f56e1b5d2553a644741a5a5644a2fdef4197e
