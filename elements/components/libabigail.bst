kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/elfutils.bst
- bootstrap/binutils.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: libabigail-*
  ref: libabigail-2.6-0-g531f836df22e19ff7a017732d5bbfa130f55bd0e
