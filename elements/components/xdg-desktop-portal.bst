kind: filter

build-depends:
- components/xdg-desktop-portal-base.bst

runtime-depends:
- components/flatpak.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue-libs.bst
- components/glib.bst
- components/pipewire-daemon.bst
- components/libgudev.bst
- components/xdg-desktop-portal-manifest.bst
- components/xdg-portal-interfaces.bst

config:
  include-orphans: true
  exclude:
  - interfaces

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/xdg-desktop-portal"
    - "%{project_licensedir}/xdg-desktop-portal/**"
