kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -Dm755 scan-for-dev-files.sh '%{install-root}%{bindir}/scan-for-dev-files'

sources:
- kind: local
  path: utils/scan-for-dev-files.sh
