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
  ref: 1.16.0-0-g88af6c8ca4106fcf70925355350a669848e9fd5a
