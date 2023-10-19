kind: filter

build-depends:
- components/gnupg-base.bst

runtime-depends:
- components/gnupg.bst
- components/gnutls.bst
- components/openldap.bst

config:
  include:
  - dirmngr
  include-orphans: False
