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
  ref: libabigail-2.9-0-gda3199c63979a891b9bc4e2ccb5185ac4de9c8d9
