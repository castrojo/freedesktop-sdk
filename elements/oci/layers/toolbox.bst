kind: compose

build-depends:
- oci/layers/toolbox-stack.bst
- components/os-release.bst
- integration/ldconfig.bst

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
