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
  ref: libabigail-2.3-54-ga125607873131fd9bd9bd94f54d503f3f46ab95f
