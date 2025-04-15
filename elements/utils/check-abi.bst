kind: manual

build-depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/file.bst
- components/python3.bst
- components/python3-pyelftools.bst
- components/libabigail.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 check-abi.py '%{install-root}%{bindir}/check-abi'

sources:
- kind: local
  path: utils/check-abi.py
