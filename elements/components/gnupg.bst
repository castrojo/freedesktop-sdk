kind: filter

build-depends:
- components/gnupg-base.bst

runtime-depends:
- bootstrap-import.bst
- components/libgcrypt.bst
- components/libassuan.bst
- components/libksba.bst
- components/npth.bst
- components/sqlite.bst
- components/gnupg-manifest.bst

config:
  exclude:
  - dirmngr
  include-orphans: True
