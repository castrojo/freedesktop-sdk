kind: cmake

depends:
- public-stacks/runtime-minimal.bst
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
  ref: v3.0.20-0-g57ce34025066935f356fd539e6deb7a7a9952618
