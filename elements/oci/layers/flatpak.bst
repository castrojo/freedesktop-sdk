kind: compose

build-depends:
- oci/layers/flatpak-stack.bst
- integration/ldconfig.bst

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
