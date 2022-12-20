kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/systemd.bst
- components/libgudev.bst

variables:
  meson-local: >-
    -Dtests=disabled

sources:
- kind: git_repo
  url: github:linuxwacom/libwacom.git
  track: libwacom-*
  ref: libwacom-2.6.0-0-gcb36c462763a321454d5c08fe974a3d7dec4ed1a
