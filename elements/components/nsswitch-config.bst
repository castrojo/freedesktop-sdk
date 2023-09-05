kind: manual

depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
  - |
    install -Dm644 nsswitch-flatpak.conf "%{install-root}%{sysconfdir}/nsswitch.conf"

sources:
- kind: local
  path: files/nsswitch-flatpak.conf
