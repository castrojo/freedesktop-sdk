kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/libevdev.bst
- components/libgudev.bst

variables:
  meson-local: >-
    -Dtests=disabled

sources:
- kind: git_repo
  url: github:linuxwacom/libwacom.git
  track: libwacom-*
  ref: libwacom-2.16.1-0-g0750361c048f423faa9651bdaf1b742118db4099
