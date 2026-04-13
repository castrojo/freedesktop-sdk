kind: manual

depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/findutils.bst
- components/kmod.bst
- components/sed.bst
- components/systemd.bst
- components/tzdata.bst
- components/util-linux.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 755 -t "%{install-root}%{bindir}" prepare-image.sh

sources:
- kind: local
  path: files/vm/prepare-image.sh
