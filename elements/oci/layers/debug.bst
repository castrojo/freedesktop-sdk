kind: compose

build-depends:
- oci/layers/sdk-stack.bst

config:
  exclude:
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
  - tests
  - shells
