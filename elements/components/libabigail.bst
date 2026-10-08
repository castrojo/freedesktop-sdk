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
  ref: libabigail-3.0-0-g768011858b2f4742ca41cda5808ed88678f0eca6
