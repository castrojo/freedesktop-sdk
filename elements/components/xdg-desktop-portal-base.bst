kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flatpak.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue.bst
- components/glib.bst
- components/pipewire.bst

variables:
  conf-local: >-
    --disable-libportal

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
  - xdg-desktop-portal-1.14
  ref: 1.17.0-0-ge31960ab3d3ecd3efeef1c97d1d40d94b866f4b7
