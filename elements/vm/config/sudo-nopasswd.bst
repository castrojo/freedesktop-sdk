kind: manual

depends:
- bootstrap-import.bst
- components/sudo.bst

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{sysconfdir}/sudoers.d" wheel-nopasswd

sources:
- kind: local
  path: files/vm/sudo-config
