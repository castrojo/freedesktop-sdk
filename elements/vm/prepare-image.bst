kind: manual

depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- bootstrap/sed.bst
- bootstrap/findutils.bst
- components/systemd.bst
- components/tzdata.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 755 -t "%{install-root}%{bindir}" prepare-image.sh

sources:
- kind: local
  path: files/vm/prepare-image.sh
