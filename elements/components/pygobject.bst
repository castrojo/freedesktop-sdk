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
  ref: 3.50.0-0-g48a875ea1c33f275f3f751d0d0a48762526a1abe
