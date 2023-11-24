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
- kind: git_repo
  url: freedesktop:pipewire/wireplumber.git
  track: '*.*.*'
  ref: 0.4.16-0-g0d249b8a13d7168fe54fa6eb1db1c4a5fcc8d3f8
- kind: git_repo
  url: github:skystrife/cpptoml.git
  directory: subprojects/cpptoml
  track: v*
  ref: v0.1.1-0-gfededad7169e538ca47e11a9ee9251bc361a9a65
