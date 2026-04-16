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
  - install -Dm644 -t "%{install-root}%{indep-libdir}/firmware" regulatory.{db,db.p7s,bin}

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/sforshee/wireless-regdb.git
  track: master-*
  ref: master-2023-09-01-0-g991b1ef696b7a034a5bf001cf31ab7735888c6e1
