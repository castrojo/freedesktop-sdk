# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 bashrc '%{install-root}%{sysconfdir}/bashrc'
  - install -Dm644 profile '%{install-root}%{sysconfdir}/profile'
  - install -Dm644 dot-profile '%{install-root}%{sysconfdir}/skel/.profile'
  - install -Dm644 dot-bashrc '%{install-root}%{sysconfdir}/skel/.bashrc'

  - install -Dm644 dot-profile '%{install-root}/root/.profile'
  - install -Dm644 dot-bashrc '%{install-root}/root/.bashrc'

sources:
- kind: local
  path: files/bash-config/profile
- kind: local
  path: files/bash-config/bashrc
- kind: local
  path: files/bash-config/dot-profile
- kind: local
  path: files/bash-config/dot-bashrc
