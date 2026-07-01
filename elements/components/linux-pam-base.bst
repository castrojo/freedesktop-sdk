# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

depends:
- components/audit.bst
- components/libeconf.bst
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/flex.bst

variables:
  meson-local: >-
    -Dpam_lastlog=enabled
    -Dexamples=false
    -Dlogind=disabled
    -Dnis=disabled
    -Dselinux=disabled
    -Ddocs=disabled
    -Delogind=disabled
    -Dpwaccess=disabled

config:
  install-commands:
    (>):
    - rm -rf "%{install-root}/var/run"

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      file="${sysroot}%{bindir}/unix_chkpwd"
      if [ -f "$file" ]; then
          chmod 4755 "$file"
      fi
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpam.so'
        - '%{libdir}/libpam_misc.so'
        - '%{libdir}/libpamc.so'
      vm-only:
        # Most of this is only useful for VM.
        # We keep only libraries for dependencies.
      - '%{sysconfdir}'
      - '%{sysconfdir}/**'
      - '%{bindir}'
      - '%{bindir}/**'
      - '%{datadir}'
      - '%{datadir}/**'
  cpe:
    product: linux-pam

sources:
- kind: git_repo
  url: github:linux-pam/linux-pam.git
  track: v*
  ref: v1.7.2-0-gfe03a10115c082a8486ccbab7462139d7e4bb067
