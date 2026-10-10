# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/vala.bst

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
  ref: v4.0.6-0-g9cfca65c122fa23b9680a28e0c9225a2fd015fc5
