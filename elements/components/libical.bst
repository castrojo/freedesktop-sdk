kind: cmake
build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/vala.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libxml2.bst

variables:
  cmake-local: >-
    -DGOBJECT_INTROSPECTION=ON
    -DENABLE_GTK_DOC=OFF
    -DICAL_GLIB=ON
    -DICAL_GLIB_VAPI=ON
    -DLIBICAL_JAVA_BINDINGS=False

sources:
- kind: git_repo
  url: github:libical/libical.git
  track: v*
  ref: v4.0.1-0-gd863f7b7a0258ccea94db287c1590ed79808deed
