kind: compose

depends:
- filename: bootstrap-import.bst
  type: build

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
