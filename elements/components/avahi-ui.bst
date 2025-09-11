kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- components/avahi.bst
- components/gtk3.bst

config:
  include:
  - ui
  - avahi-license
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-ui-gtk3.so"
    overlap-whitelist:
    - "%{project_licensedir}/avahi"
    - "%{project_licensedir}/avahi/**"
