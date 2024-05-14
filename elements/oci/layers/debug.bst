kind: compose

build-depends:
- sdk.bst
- components/os-release.bst
- integration/ldconfig.bst

config:
  exclude:
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
