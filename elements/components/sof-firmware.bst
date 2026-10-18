# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/rsync.bst

environment:
  FW_DEST: '%{install-root}%{indep-libdir}/firmware/intel'
  TOOLS_DEST: '%{build-root}/do-not-install'

variables:
  strip-binaries: ''

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
  url: github_files:thesofproject/sof-bin/releases/download/v2026.09.2/sof-bin-2026.09.2.tar.gz
  ref: 5f7bc30b2b5c1e6b0da55a33fc44e2b7f56ae9b06952edcde614f51ef6b943e1
