kind: compose

build-depends:
- oci/layers/flatpak-stack.bst

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
