kind: compose

config:
  exclude:
  - sysconf
  - devel
  - extra
  - vm-only

build-depends:
- platform.bst
- components/os-release.bst
- vm/mesa-default.bst
