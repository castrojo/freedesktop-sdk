kind: cmake

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libxml2.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/vala.bst

variables:
  cmake-local: >-
    -DGOBJECT_INTROSPECTION=ON
    -DENABLE_GTK_DOC=OFF
    -DICAL_GLIB=ON
    -DICAL_GLIB_VAPI=ON

sources:
- kind: git_repo
  url: github:libical/libical.git
  track: v*
  ref: v3.0.17-0-g105cebc60084bd986d4e7904eadb56f5b587aa27
