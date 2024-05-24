kind: compose

build-depends:
- sdk.bst
- components/os-release.bst

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
