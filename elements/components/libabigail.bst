kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- bootstrap/xxhash.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/elfutils.bst
- bootstrap/binutils.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: libabigail-*
  ref: libabigail-2.6-0-g202b9f964f8025de21003c3e3e7c446f794de345
