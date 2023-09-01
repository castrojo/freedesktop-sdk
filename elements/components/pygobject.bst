kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

sources:
- kind: git_tag
  url: gnome:pygobject.git
  track: master
  track-extra:
  - pygobject-3-44
  match:
  - '*.*[02468].*'
  ref: 3.44.1-0-g1a2544c898ca2aafcab0c9e472be22657f310cf3
