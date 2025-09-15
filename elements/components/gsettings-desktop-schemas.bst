kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gnome:gsettings-desktop-schemas.git
  track: '*.*'
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 49.0-0-gd3559010b4eddec3df9cdb9ea738c03e9e6800fe
