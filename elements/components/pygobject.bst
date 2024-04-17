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
  track: '*.*[02468].*'
  ref: 3.48.2-0-g02be5508acd0abd8567b319e0830947994c57320
