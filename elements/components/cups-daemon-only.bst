kind: filter

build-depends:
- components/cups-base.bst

runtime-depends:
- components/cups.bst

config:
  exclude:
  - cups-libs
  include-orphans: true

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/cups"
    - "%{project_licensedir}/cups/**"
