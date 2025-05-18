kind: compose

config:
  exclude:
  - devel
  - extra
  - vm-only
  - tests
  - shells

build-depends:
- platform.bst
- components/os-release.bst
- vm/mesa-default.bst
