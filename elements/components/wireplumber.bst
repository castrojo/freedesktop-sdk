kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-cmake.bst
- components/pipewire-base.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/doxygen.bst
- components/flex.bst
- components/hotdoc.bst
- components/lua.bst

depends:
- components/glib.bst
- components/pygobject.bst
- components/systemd.bst

variables:
  meson-local: >-
    -Dsystem-lua=true
    -Delogind=disabled
    -Ddoc=disabled

sources:
- kind: git_tag
  url: freedesktop:pipewire/wireplumber.git
  track: master
  ref: 0.4.11-0-g80b3559963f0ad40a7bfa6c23b0098275c0b5ebe
- kind: git_tag
  url: github:skystrife/cpptoml.git
  directory: subprojects/cpptoml
  track: master
  ref: v0.1.1-0-gfededad7169e538ca47e11a9ee9251bc361a9a65
- kind: patch
  path: files/wireplumber/c16e637c329bc9dda8544b18f5bd47a8d63ee253.patch
