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
  ref: libwacom-2.5.0-0-gc6c1b26ad149a88b22ff790dae377fcc935b7e08
