kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst
- components/python3-pyelftools.bst
- components/libabigail.bst

config:
  install-commands:
  - |
    install -Dm755 check-abi.py '%{install-root}%{bindir}/check-abi'

sources:
- kind: local
  path: utils/check-abi.py
