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
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master
  ref: libwacom-2.8.0-0-gf5b92814320d0a5745b50b7b36103843ad23e299
