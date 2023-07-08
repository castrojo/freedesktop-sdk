kind: manual

depends:
- components/python3.bst

config:
  install-commands:
  - |
    install -Dm755 check-debug-crc.py '%{install-root}%{bindir}/check-debug-crc'

sources:
- kind: local
  path: utils/check-debug-crc.py
