kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- components/avahi.bst

config:
  include:
  - ui
  - avahi-license
  include-orphans: False

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
