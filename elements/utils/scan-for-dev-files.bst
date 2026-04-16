kind: manual

depends:
- bootstrap/binutils.bst
- bootstrap/findutils.bst
- bootstrap/sed.bst
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 scan-for-dev-files.sh '%{install-root}%{bindir}/scan-for-dev-files'

sources:
- kind: local
  path: utils/scan-for-dev-files.sh
