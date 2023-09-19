kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flatpak-minimal.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue-libs.bst
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
  track: '*.*.*'
  ref: 1.18.0-0-ga4b27063222b16652e73b422e5448d75335199ef
