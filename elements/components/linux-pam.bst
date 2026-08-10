# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: |
  Base configuration files for PAM authentication system.

  PAM is an authentication framework, used by most Linux operating systems to
  authenticate and manage user logins. The PAM client library and the plugins
  are provided by `components/linux-pam-base.bst`.

  This element provides a default configuration which you should review and
  adapt for your use case. Other elements can install PAM configuration
  for specific utilities. In particular, see `components/shadow.bst` which
  includes a `/usr/bin/login` implementation and PAM configuration.

  The "Linux PAM System Administrators' Guide" is recommended reading to
  understand PAM configuration, it is available in the linux-pam source code
  repository at `doc/sag`.

  This element is intended for system integration, it is not included
  in Flatpak or OCI images.

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/linux-pam-base.bst
- components/pwquality.bst

variables:
  pamconfdir: "%{sysconfdir}/pam.d"
  strip-binaries: ''

config:
  build-commands:
  - for tty in tty{1..6}; do echo "${tty}"; done >securetty

  install-commands:
  - install -Dm 644 -t "%{install-root}%{pamconfdir}" pam.d/*
  - install -Dm644 -t "%{install-root}%{sysconfdir}" securetty

sources:
- kind: local
  path: files/linux-pam-config
  directory: pam.d
