kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flatpak.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue.bst
- components/glib.bst
- components/pipewire.bst
- components/python3-docutils.bst
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
  cpe:
    product: xdg-desktop-portal

sources:
- kind: git_repo
  url: github:flatpak/xdg-desktop-portal.git
  track: '*.*[02468].*'
  ref: 1.18.1-0-g37a6f7c8b8e08b9861f05e172cd4e0d07a832c4d
