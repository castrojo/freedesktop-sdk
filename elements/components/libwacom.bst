kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/libgudev.bst
- components/systemd.bst

variables:
  meson-local: -Dtests=disabled

sources:
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master
  ref: libwacom-2.6.0-0-gcb36c462763a321454d5c08fe974a3d7dec4ed1a
