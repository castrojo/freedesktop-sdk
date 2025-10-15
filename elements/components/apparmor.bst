kind: filter

build-depends:
- components/_private/apparmor-base.bst

runtime-depends:
- components/libapparmor.bst
- components/linux-pam-base.bst

config:
  exclude:
  - libapparmor
  include-orphans: True
