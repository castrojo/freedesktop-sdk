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
  ref: libwacom-2.15.0-0-gd195a17277f57e26af7e2eff88d48e11735be1ea
