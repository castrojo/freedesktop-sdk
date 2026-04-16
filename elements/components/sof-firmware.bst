kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/rsync.bst

variables:
  strip-binaries: ''

environment:
  FW_DEST: '%{install-root}%{indep-libdir}/firmware/intel'
  TOOLS_DEST: '%{build-root}/do-not-install'

config:
  install-commands:
  - |
    install -dm755 "${FW_DEST}"

  - |
    install -dm755 "${TOOLS_DEST}"

  - |
    bash -x install.sh

  - |
    %{install-extra}

sources:
- kind: tar
  url: github_files:thesofproject/sof-bin/releases/download/v2025.12.2/sof-bin-2025.12.2.tar.gz
  ref: 533f63e3a6d94c09ce05a782657b675fa683ff20787c0979226cf563ec79f517
