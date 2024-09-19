kind: compose

build-depends:
- oci/layers/bootstrap-stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - vm-only
