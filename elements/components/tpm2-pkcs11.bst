# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/python3-pkcs11.bst

depends:
- components/libyaml.bst
- components/python3-cryptography.bst
- components/python3-pyasn1-modules.bst
- components/python3-pyasn1.bst
- components/python3-pyyaml.bst
- components/python3-tpm2-pytss.bst
- components/python3.bst
- components/sqlite.bst
- components/tpm2-tools.bst

variables:
  local_flags: >-
    -Wno-error

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-pkcs11.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 1.10.1-0-g9a3bfbd6b9e20513cbf5413b395ba1fe8b23ef0c
