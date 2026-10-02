kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/doxygen.bst
- components/flex.bst
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
  ref: 0.5.18-0-g81606cbb32d29df20147d1b68b662c1082654d81
- kind: git_repo
  url: github:skystrife/cpptoml.git
  directory: subprojects/cpptoml
  track: v*
  ref: v0.1.1-0-gfededad7169e538ca47e11a9ee9251bc361a9a65
