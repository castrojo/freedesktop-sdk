# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  util-linux utilities for operating systems.

  This element includes utility programs that are used by libraries and apps in
  operating systems, but are not used in the Flatpak ecosystem.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/util-linux.bst
- components/util-linux-libfdisk.bst
- components/libcap-ng.bst

config:
  include:
  - vm-tools
  include-orphans: false

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      for i in mount umount; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
