kind: compose

build-depends:
- vm/minimal-ostree/deps.bst

config:
  exclude:
  - debug
  - devel
  - doc
  include-orphans: True
