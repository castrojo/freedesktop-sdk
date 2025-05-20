kind: compose

build-depends:
- vm/desktop/deps.bst

config:
  exclude:
  - debug
  - devel
  - tests
  - shells
  include-orphans: True
