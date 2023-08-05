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
- components/docbook-xsl.bst
- components/xmlto.bst

variables:
  meson-local: >-
    -Dlibportal=disabled
    -Dpytest=disabled

public:
  bst:
    split-rules:
      interfaces:
      - "%{datadir}/pkgconfig/*.pc"
      - "%{datadir}/dbus-1/interfaces"
      - "%{datadir}/dbus-1/interfaces/org.freedesktop.portal*"

sources:
- kind: git_repo
  url: github:flatpak/xdg-desktop-portal.git
  track: '*.*.*'
  ref: 1.17.0-0-ge31960ab3d3ecd3efeef1c97d1d40d94b866f4b7
