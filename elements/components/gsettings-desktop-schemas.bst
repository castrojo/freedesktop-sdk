kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: 50.0-0-g0b3ea8e1a25ecfc33e9f6af1b1db93c4032b84e6
