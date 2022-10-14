kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/bison.bst
- components/itstool.bst

depends:
- bootstrap-import.bst
- components/linux-pam.bst

variables:
  autogen: autoreconf -fvi
  # This element appears to generate code into wrong paths with build-dir
  build-dir: ''
  conf-local: >-
    --with-libpam
    --without-selinux
    --enable-man

  make-install: make -j1 install DESTDIR="%{install-root}" ubindir="%{bindir}" usbindir="%{sbindir}"

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
      # FIXME: BuildStream does not support that
      #setcap cap_setuid+ep "${sysroo}%{bindir}/newuidmap"
      #setcap cap_setgid+ep "${sysroo}%{bindir}/newgidmap"
      chmod 4755 "${sysroot}%{bindir}/newuidmap"
      chmod 4755 "${sysroot}%{bindir}/newgidmap"

sources:
- kind: git_tag
  url: github:shadow-maint/shadow.git
  track: master
  ref: 4.12.2-0-g238aa9294870a890039995fe326d0a65f2632f0b
