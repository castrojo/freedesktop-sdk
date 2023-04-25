kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

sources:
- kind: git_tag
  url: sourceware:libabigail.git
  track: master
  track-tags: false
  ref: libabigail-2.2-99-g6ba26ed6ae74cf54c87cde1df163e5f086bbcfce
