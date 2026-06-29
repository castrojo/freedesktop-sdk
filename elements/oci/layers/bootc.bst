kind: compose

build-depends:
- oci/layers/bootc-stack.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - extra
  - tests
