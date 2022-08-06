kind: filter

build-depends:
- components/polkit-base.bst

runtime-depends:
- components/polkit-gobject.bst
- components/duktape.bst
- components/linux-pam.bst

config:
  exclude:
  - polkit-gobject
  include-orphans: true

