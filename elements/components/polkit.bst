# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/polkit-base.bst

runtime-depends:
- components/polkit-gobject.bst
- components/polkit-manifest.bst
- components/duktape.bst
- components/linux-pam.bst

config:
  exclude:
  - polkit-gobject
  include-orphans: true

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{indep-libdir}/polkit-1/polkit-agent-helper-1"
      chmod 4755 "${sysroot}%{bindir}/pkexec"
