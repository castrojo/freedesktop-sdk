kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

sources:
- kind: git_repo
  url: gnome:gsettings-desktop-schemas.git
  track: '*.*'
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 46.1-0-gcdc2142b245fd22c1e8f728e9bc5323e7ed42560
