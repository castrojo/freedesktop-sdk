kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst
- components/python3-pyelftools.bst

config:
  install-commands:
  - |
    install -Dm755 find-rpath.py '%{install-root}%{bindir}/find-rpath'

sources:
- kind: local
  path: utils/find-rpath.py
