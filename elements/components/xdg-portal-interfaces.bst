kind: filter

build-depends:
- components/xdg-desktop-portal-base.bst

runtime-depends:
- components/xdg-desktop-portal-manifest.bst

config:
  include:
  - interfaces
  - xdp-license

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/xdg-desktop-portal"
    - "%{project_licensedir}/xdg-desktop-portal/**"
