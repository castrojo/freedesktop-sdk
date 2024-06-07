kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/systemd.bst
- components/libevdev.bst
- components/libgudev.bst

variables:
  meson-local: >-
    -Dtests=disabled

sources:
- kind: git_repo
  url: github:linuxwacom/libwacom.git
  track: libwacom-*
  ref: libwacom-2.12.0-0-g1e3783e2f2507e9f589b931c8e37fb4e22254d94
