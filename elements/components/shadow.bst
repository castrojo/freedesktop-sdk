kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/bison.bst
- components/itstool.bst

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
  ref: 4.17.3-0-gd3fa0ba5b8eccc5315af0945c8a2386f92513fcf
