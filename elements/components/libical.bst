kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/vala.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libxml2.bst

variables:
  cmake-local: >-
    -DLIBICAL_GLIB_BUILD_DOCS=OFF
    -DLIBICAL_GLIB_VAPI=ON
    -DLIBICAL_GOBJECT_INTROSPECTION=ON
    -DLIBICAL_JAVA_BINDINGS=OFF

sources:
- kind: git_repo
  url: github:libical/libical.git
  track: v*
  ref: v4.0.2-0-g939675ce07d3f6dc7d3143adb8523faa5f328de7
