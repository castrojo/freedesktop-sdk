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
  ref: 1.19.3-0-g10bb4d7d06172fa20d041a9ab135be670ce11629
- kind: patch
  path: patches/xdg-desktop-portal/disable-tests.patch
