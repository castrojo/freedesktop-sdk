kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: gnome:pygobject.git
  track: '3.50.*'
  ref: 3.50.1-0-gf40a614068c9912fbf22fae62a7d3eb640549113
