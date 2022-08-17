kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flatpak-minimal.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue.bst
- components/glib.bst
- components/pipewire.bst

variables:
  meson-local: >-
    -Dlibportal=disabled
    -Ddocbook-docs=disabled

public:
  bst:
    split-rules:
      interfaces:
      - "%{datadir}/pkgconfig/*.pc"
      - "%{datadir}/dbus-1/interfaces"
      - "%{datadir}/dbus-1/interfaces/org.freedesktop.portal*"

sources:
- kind: git_tag
  url: github:flatpak/xdg-desktop-portal.git
  track: main
  track-extra:
  - xdg-desktop-portal-1.15
  ref: 1.15.0-0-g95b70566e05ef493539cdcbe2d9321a529858eb7
- kind: patch
  path: patches/xdg-desktop-portal/test-portals-Include-utils-even-if-libportal-is-unav.patch
