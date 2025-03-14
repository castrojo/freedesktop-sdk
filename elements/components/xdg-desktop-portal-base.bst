kind: meson

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flatpak-minimal.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue-libs.bst
- components/glib.bst
- components/pipewire.bst
- components/libgudev.bst

variables:
  meson-local: >-
    -Dlibportal=disabled
    -Dpytest=disabled
    -Ddocumentation=disabled
    -Dman-pages=disabled

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
  # Track unstable too for xdp-gnome/gnome-nightly
  track: '*.*.*'
  ref: 1.20.0-0-g85df26fb1c53334969fea3f15c2a06a14831094b
- kind: patch
  path: patches/xdg-desktop-portal/disable-tests.patch
