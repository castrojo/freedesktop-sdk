kind: filter

build-depends:
- components/dbus-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libdbus.bst

config:
  include:
  - dbus-tools
  - dbus-license
  include-orphans: false

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/dbus"
    - "%{project_licensedir}/dbus/**"
