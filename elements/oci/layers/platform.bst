kind: compose

build-depends:
- platform.bst
- components/os-release.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - vm-only
