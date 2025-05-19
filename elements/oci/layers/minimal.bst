kind: compose

build-depends:
- oci/layers/minimal-stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - vm-only
  - tests
  - shells
