kind: manual

depends:
- public-stacks/runtime-gnu.bst

runtime-depends:
- bootstrap/binutils.bst
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 check-debug-crc.py '%{install-root}%{bindir}/check-debug-crc'

sources:
- kind: local
  path: utils/check-debug-crc.py
