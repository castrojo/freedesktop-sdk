kind: filter

build-depends:
- components/geoclue-base.bst

runtime-depends:
- components/geoclue-libs.bst
- components/avahi-gobject.bst

config:
  exclude:
  - libgeoclue
  include-orphans: True

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/geoclue"
    - "%{project_licensedir}/geoclue/**"
