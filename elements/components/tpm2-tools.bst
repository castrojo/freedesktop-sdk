# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- components/tpm2-tss.bst

variables:
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-tools.git
  track: '*.*'
  exclude:
  - '*rc*'
  ref: 5.8-0-gbc25f7149372002d4d595195b2d09a1a6d18bca1
