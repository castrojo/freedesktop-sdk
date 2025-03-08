kind: manual

build-depends:
- public-stacks/runtime-minimal.bst
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

sources:
- kind: tar
  url: github_files:thesofproject/sof-bin/releases/download/v2025.01/sof-bin-2025.01.tar.gz
  ref: 34d565db757a32450106317cc51f38bf67962e0fc8b7f7c72e6e39fd89e99263
