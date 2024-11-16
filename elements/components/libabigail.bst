kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: libabigail-*
  ref: libabigail-2.6-3-g8f70e52e821e9904e450e06ca6717a8fc0c74fe1
