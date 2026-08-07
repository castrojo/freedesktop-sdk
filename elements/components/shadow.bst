# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: |
  shadow-utils package.

  The shadow-utils package includes programs for managing user and group
  accounts, such as `passwd`, `useradd`, and `groupmod`. It also includes
  `login`, the console login handler, and `su`, the tool to become another
  user.

  This element builds the shadow-utils with PAM support enabled. Access control
  for these system administration tools is configured via the included PAM
  configuration files, and the base PAM configuration provided by
  `components/linux-pam.bst`.

  This element is intended for system integration, it is not included
  in Flatpak or OCI images.

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/docbook-xsl.bst
- components/itstool.bst
- components/libxslt.bst

depends:
- public-stacks/runtime-minimal.bst
- components/linux-pam.bst

variables:
  autogen: autoreconf -fvi
  # This element appears to generate code into wrong paths with build-dir
  build-dir: ''
  conf-local: >-
    --with-libpam
    --without-selinux
    --without-libbsd
    --enable-man
    --disable-logind

  make-install: make -j1 %{make-install-args} ubindir="%{bindir}" usbindir="%{sbindir}"

config:
  install-commands:
    (>):
    - |
      # remove pam_selinux and pam_console from the config
      # as we don't build them
      sed -i /pam_selinux/d %{install-root}%{sysconfdir}/pam.d/*
      sed -i /pam_console/d %{install-root}%{sysconfdir}/pam.d/*

    - touch '%{install-root}%{sysconfdir}/subuid'
    - touch '%{install-root}%{sysconfdir}/subgid'

    - rm %{install-root}%{sysconfdir}/pam.d/chfn
    - rm %{install-root}%{sysconfdir}/pam.d/chsh

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      for i in su passwd gpasswd chsh chfn newgrp; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done
      for i in expiry chage; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done
      # If those fail, please use components/fakecap.bst in LD_PRELOAD
      setcap cap_setuid+ep "${sysroot}%{bindir}/newuidmap"
      setcap cap_setgid+ep "${sysroot}%{bindir}/newgidmap"

sources:
- kind: git_repo
  url: github:shadow-maint/shadow.git
  track: '*.*'
  exclude:
  - '*-rc*'
  ref: 4.20.0-0-g1995a05ce99f5164e1b3b2d194c4ef8ddf05be97
