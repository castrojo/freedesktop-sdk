# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/pkg-config.bst
- components/systemd.bst

runtime-depends:
- components/openssh.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    systemdsystemunitdir="$(pkg-config --variable systemdsystemunitdir systemd)"
    install -Dm644 -t "%{install-root}${systemdsystemunitdir}" sshd.service

  - |
    systemdsystempresetdir="$(pkg-config --variable systemdsystempresetdir systemd)"
    install -Dm644 -t "%{install-root}${systemdsystempresetdir}" openssh.preset

  - |
    sysusersdir="$(pkg-config --variable sysusersdir systemd)"
    install -Dm644 openssh-sysusers.conf "%{install-root}${sysusersdir}/openssh.conf"

  - |
    tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
    install -Dm644 openssh-tmpfiles.conf "%{install-root}${tmpfilesdir}/openssh.conf"

sources:
- kind: local
  path: files/openssh-systemd/sshd.service
- kind: local
  path: files/openssh-systemd/openssh.preset
- kind: local
  path: files/openssh-systemd/openssh-sysusers.conf
- kind: local
  path: files/openssh-systemd/openssh-tmpfiles.conf
