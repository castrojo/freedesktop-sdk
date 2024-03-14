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
  ref: 3.48.1-0-g67b807613a93544fb7ff8f456b0de004950f7da4
