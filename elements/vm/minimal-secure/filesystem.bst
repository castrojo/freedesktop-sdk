kind: compose

build-depends:
- vm/minimal-secure/deps.bst

config:
  exclude:
  - debug
  - devel
  - doc
  include-orphans: True
  (?):
  - ("locale" not in minimal_vm):
      exclude:
        (>):
        - locale
