kind: filter

build-depends:
- components/flex-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/m4.bst
- components/libfl.bst

config:
  exclude:
  - libfl
