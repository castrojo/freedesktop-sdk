kind: cmake
build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/python3-gi-docgen.bst
- components/vala.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libxml2.bst

variables:
  cmake-local: >-
    -DLIBICAL_GOBJECT_INTROSPECTION=ON
    -DLIBICAL_BUILD_DOCS=ON
    -DICAL_GLIB=ON
    -DLIBICAL_GLIB_VAPI=ON
    -DLIBICAL_BUILD_EXAMPLES=OFF
    -DLIBICAL_JAVA_BINDINGS=OFF

sources:
- kind: git_repo
  url: github:libical/libical.git
  track: v*
  ref: v4.0.0-0-ga4aceb43adb8a40578c758ab13d40f233868a1eb
