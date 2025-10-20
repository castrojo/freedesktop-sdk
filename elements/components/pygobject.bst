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
  ref: 3.50.2-0-gad3de74ee96f21102475297779a44965d3333a06
