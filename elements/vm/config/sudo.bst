kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- public-stacks/runtime-minimal.bst
- components/sudo.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{sysconfdir}/sudoers.d" wheel

sources:
- kind: local
  path: files/vm/sudo-config
