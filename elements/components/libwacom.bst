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
  ref: libwacom-2.7.0-0-gf2382b3ffbdaa773e148d167a59bd35f5da4c7ec
