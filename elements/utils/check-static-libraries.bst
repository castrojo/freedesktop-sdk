kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst

config:
  install-commands:
  - |
    install -Dm755 check-static-libraries.py '%{install-root}%{bindir}/check-static-libraries'

sources:
- kind: local
  path: utils/check-static-libraries.py
