kind: compose

build-depends:
- platform.bst
- components/os-release.bst
- integration/ldconfig.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - vm-only
