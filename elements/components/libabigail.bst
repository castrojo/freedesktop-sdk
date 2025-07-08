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
  ref: libabigail-2.8-0-ga910b338ee14159c700f0a977aa4320c9c359ad7
