kind: filter

depends:
- filename: components/xdg-desktop-portal-base.bst
  type: build
- filename: components/xdg-desktop-portal-manifest.bst
  type: runtime

config:
  include:
  - interfaces
  - xdp-license

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/xdg-desktop-portal"
    - "%{project_licensedir}/xdg-desktop-portal/**"
