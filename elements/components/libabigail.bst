kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/binutils.bst
- bootstrap/xxhash.bst
- components/elfutils.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: libabigail-*
  ref: libabigail-2.7-0-gad42835090fbe5cf0614527528fc14d66733c556
