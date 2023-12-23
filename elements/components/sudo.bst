kind: autotools

build-depends:
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/linux-pam-base.bst

config:
  install-commands:
    (>):
    - |
      install -Dm644 pam.conf "%{install-root}%{sysconfdir}/pam.d/sudo"

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers.d"/*
      chmod 4755 "${sysroot}%{bindir}/sudo"

sources:
- kind: git_repo
  url: github:sudo-project/sudo.git
  track: SUDO_*
  ref: SUDO_1_9_15p4-0-g2535c5ae14d376431c8fa5c60cb3b9f0802b41cf
- kind: local
  path: files/sudo/pam.conf
