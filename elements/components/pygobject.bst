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
  - pygobject-3-42
  ref: 3.44.0-0-g894f8b1dd3246bad6edb75aa86f61f6d83531a33
