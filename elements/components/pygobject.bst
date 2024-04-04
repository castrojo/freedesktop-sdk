kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

sources:
- kind: git_repo
  url: gnome:pygobject.git
  ref: 3.46.0-0-gb5b3fb1fcdbf539dd0cc04120ee4a8e81bce403c
