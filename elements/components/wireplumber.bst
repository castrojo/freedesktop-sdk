# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-cmake.bst
- public-stacks/buildsystem-meson.bst
- components/_private/git-minimal.bst
- components/doxygen.bst
- components/flex.bst
- components/gobject-introspection.bst
- components/hotdoc.bst
- components/lua.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/pipewire.bst
- components/pygobject.bst
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Dsystem-lua=true
    -Delogind=disabled
    -Ddoc=disabled

sources:
- kind: git_repo
  url: freedesktop:pipewire/wireplumber.git
  track: '*.*.*'
  ref: 0.5.15-0-gbc4fa8f5e84806f86530c97cb35283eecc3ec081
- kind: git_repo
  url: github:skystrife/cpptoml.git
  directory: subprojects/cpptoml
  track: v*
  ref: v0.1.1-0-gfededad7169e538ca47e11a9ee9251bc361a9a65
