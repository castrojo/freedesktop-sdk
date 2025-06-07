kind: compose

build-depends:
- components/shadow.bst
- oci/oci-builder-base.bst

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
