kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

runtime-depends:
- components/shadow.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}/etc/default" useradd

sources:
- kind: local
  path: files/vm/useradd-config-ostree/useradd
