# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p '%{install-root}%{includedir}'
  - cp -rT '%{gcc_triplet}' '%{install-root}%{includedir}/%{gcc_triplet}'

sources:
- kind: git_repo
  track: main
  url: fdsdk_git:vmlinux-h.git
  ref: aee5c9b8fb77282d458f318369dfaf6d7d9cb59f
