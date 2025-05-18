kind: compose

config:
  exclude:
  - sysconf
  - devel
  - extra
  - vm-only
  - tests
  - shells

build-depends:
- platform.bst
- components/os-release.bst
- vm/mesa-default.bst
