kind: compose
description: |
  This element provides a minimal environment in which intitial scripts
  for oci elements run. If there is a need by downstreams to run more
  exotic commands, this should be overridden. This is intentionally
  kept minimal.

build-depends:
- public-stacks/runtime-gnu.bst
- components/oci-builder.bst

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
