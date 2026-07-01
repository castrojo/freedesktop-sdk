# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: Adds a link from /etc/mtab -> /proc/self/mounts

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/etc"
    ln -s ../../proc/self/mounts %{install-root}/etc/mtab
