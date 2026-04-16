# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst

depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm0755 fdsdk-lic-dedup.py "%{install-root}%{bindir}/fdsdk-lic-dedup"

public:
  bst:
    integration-commands:
    - fdsdk-lic-dedup

sources:
- kind: local
  path: files/fdsdk-lic-dedup/fdsdk-lic-dedup.py
