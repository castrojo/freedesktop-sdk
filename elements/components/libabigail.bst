kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

variables:
  local_flags: "-O0"

sources:
- kind: git_tag
  url: sourceware:libabigail.git
  track: master
  ref: libabigail-2.3-0-gcdf3f8e2370b9c393b9fec097a8ef2dde2d45101
