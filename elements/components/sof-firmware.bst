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
  url: github_files:thesofproject/sof-bin/releases/download/v2025.05/sof-bin-2025.05.tar.gz
  ref: e2f2603b0d38c7cbdb1672901863fbf84b4db4921f405952a236915cb8a86bcc
