kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm644 nsswitch-flatpak.conf "%{install-root}%{sysconfdir}/nsswitch.conf"

sources:
- kind: local
  path: files/nsswitch-flatpak.conf
