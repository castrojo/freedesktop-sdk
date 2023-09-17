kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

sources:
- kind: git_tag
  url: gnome:gsettings-desktop-schemas.git
  track: master
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 45.0-0-g5e903c1c205086495213dedc32b0ad50f6010c27
